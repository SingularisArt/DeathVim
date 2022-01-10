/**
 * Plugin to enable, disable, and ignore messages.
 *
 * @type {import('unified').Plugin<[Options], Root>}
 * @returns {(node: Root, file: VFile) => void}
 */
export default function remarkMessageControl(
  options: Options
): (node: Root, file: VFile) => void
export type Root = import('mdast').Root
export type VFile = import('vfile').VFile
export type MessageControl = typeof import('unified-message-control')
export type Options =
  | Omit<import('unified-message-control').OptionsWithoutReset, 'marker'>
  | Omit<import('unified-message-control').OptionsWithReset, 'marker'>
