" Preserve existing doge settings.
let b:doge_patterns = get(b:, 'doge_patterns', {})
let b:doge_supported_doc_standards = get(b:, 'doge_supported_doc_standards', [])
if index(b:doge_supported_doc_standards, 'numpy_custom') < 0
  call add(b:doge_supported_doc_standards, 'numpy_custom')
endif

" Set the new doc standard as default.
let b:doge_doc_standard = 'numpy_custom'

" Ensure we do not overwrite an existing doc standard.
if !has_key(b:doge_patterns, 'numpy_custom')
  let b:doge_patterns['numpy_custom'] = [
        \  {
        \    'nodeTypes': ['NODE_TYPE_A', 'NODE_TYPE_B'],
        \    'parameters': {
        \      'format': '@param {name} !description',
        \    },
        \    'template': [
        \      '"""',
        \      '!summary',
        \      '',
        \      '!description',
        \      '%(parameters|)%',
        \      '%(parameters|Parameters)%',
        \      '%(parameters|----------)%',
        \      '%(parameters|{parameters})%',
        \      '%(returnType|)%',
        \      '%(returnType|Returns)%',
        \      '%(returnType|-------)%',
        \      '%(returnType|{returnType})%',
        \      '%(returnType|\t!description)%',
        \      '%(exceptions|)%',
        \      '%(exceptions|Raises)%',
        \      '%(exceptions|------)%',
        \      '%(exceptions|{exceptions})%',
        \      '"""',
        \    ],
        \  },
        \]
endif
