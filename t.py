

class T(object):

    def __getattr__(self, v):
        print('T::get', v)
        return self

    def __getattribute__(self, v):
        print('T::__getattribute__', v)
        return self

    def __setattr__(self, k, v):
        print('T::__setattribute__', k, v)
        return self

v = T()
v.int = 10
print('done', v)
