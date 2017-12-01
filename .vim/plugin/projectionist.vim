let g:projectionist_heuristics = {
  \   '*': {
  \     '*.c': {
  \       'alternate': '{}.h',
  \       'type': 'source'
  \     },
  \     '*.h': {
  \       'alternate': '{}.c',
  \       'type': 'header'
  \     },
  \   }
  \ }
