## PySpejd

Python wrapper for [Spejd (libspejd)](http://zil.ipipan.waw.pl/Spejd/), a tool for partial parsing and rule-based morphosyntactic disambiguation

### Requirements:

    - libspejd >= 1.40b
    - optional Cython >= 0.20

### Install:

    python setup.py build_ext --inplace

#### With pip:

    pip install git+https://github.com/kszucs/pyspejd.git

### Usage

```python

import pyspejd

spejd = pyspejd.Spejd('./examples/config.ini')

text = u'Warszawa jest ośrodkiem naukowym, kulturalnym, politycznym oraz '
       u'gospodarczym na skalę europejską.'

result = spejd.process_data(text.encode('utf-8'))

print spejd.get_final_report()
```
