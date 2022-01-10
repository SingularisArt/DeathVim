/**
 * @typedef {string|number|boolean} MarkerParameterValue
 * @typedef {import('mdast').Root} Root
 * @typedef {import('mdast').Content} Content
 * @typedef {import('mdast').HTML} HTML
 * @typedef {import('mdast-util-mdx-expression').MDXFlowExpression} MDXFlowExpression
 * @typedef {import('mdast-util-mdx-expression').MDXTextExpression} MDXTextExpression
 * @typedef {Root|Content} Node
 * @typedef {Object.<string, MarkerParameterValue>} MarkerParameters
 *
 * @typedef Mdx1CommentNode
 * @property {'comment'} type
 * @property {string} value
 *
 * @typedef Marker
 * @property {string} name
 * @property {string} attributes
 * @property {MarkerParameters|null} parameters
 * @property {HTML|Mdx1CommentNode|MDXFlowExpression|MDXTextExpression} node
 */

const commentExpression = /\s*([a-zA-Z\d-]+)(\s+([\s\S]*))?\s*/
const esCommentExpression = new RegExp(
  '(\\s*\\/\\*' + commentExpression.source + '\\*\\/\\s*)'
)
const markerExpression = new RegExp(
  '(\\s*<!--' + commentExpression.source + '-->\\s*)'
)

/**
 * Parse a comment marker.
 * @param {unknown} value
 * @returns {Marker|null}
 */
export function commentMarker(value) {
  if (
    isNode(value) &&
    (value.type === 'html' ||
      // @ts-expect-error: MDX@1
      value.type === 'comment' ||
      value.type === 'mdxFlowExpression' ||
      value.type === 'mdxTextExpression')
  ) {
    let offset = 2
    /** @type {RegExpMatchArray|null|undefined} */
    let match

    // @ts-expect-error: MDX@1
    if (value.type === 'comment') {
      // @ts-expect-error: MDX@1
      match = value.value.match(commentExpression)
      offset = 1
    } else if (value.type === 'html') {
      match = value.value.match(markerExpression)
    } else if (
      value.type === 'mdxFlowExpression' ||
      value.type === 'mdxTextExpression'
    ) {
      match = value.value.match(esCommentExpression)
    }

    if (match && match[0].length === value.value.length) {
      const parameters = parseParameters(match[offset + 1] || '')

      if (parameters) {
        return {
          name: match[offset],
          attributes: (match[offset + 2] || '').trim(),
          parameters,
          node: value
        }
      }
    }
  }

  return null
}

/**
 * Parse `value` into an object.
 *
 * @param {string} value
 * @returns {MarkerParameters|null}
 */
function parseParameters(value) {
  /** @type {MarkerParameters} */
  const parameters = {}

  return value
    .replace(
      /\s+([-\w]+)(?:=(?:"((?:\\[\s\S]|[^"])+)"|'((?:\\[\s\S]|[^'])+)'|((?:\\[\s\S]|[^"'\s])+)))?/gi,
      replacer
    )
    .replace(/\s+/g, '')
    ? null
    : parameters

  /**
   * @param {string} _
   * @param {string} $1
   * @param {string} $2
   * @param {string} $3
   * @param {string} $4
   */
  // eslint-disable-next-line max-params
  function replacer(_, $1, $2, $3, $4) {
    /** @type {MarkerParameterValue} */
    let value = $2 || $3 || $4 || ''

    if (value === 'true' || value === '') {
      value = true
    } else if (value === 'false') {
      value = false
    } else if (!Number.isNaN(Number(value))) {
      value = Number(value)
    }

    parameters[$1] = value

    return ''
  }
}

/**
 * @param {unknown} value
 * @returns {value is Node}
 */
function isNode(value) {
  return Boolean(value && typeof value === 'object' && 'type' in value)
}
