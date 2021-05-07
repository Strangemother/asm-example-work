import unittest


class TestThings(unittest.TestCase):

    def test_label(self):
        """A Reg shortcut should render the asm standard
        """
        a = asm.ax.xor()
        b = asm.xor(rex.ax, reg.ax)
        #c = asm.mov(rex.ax, '0h')

        self.assertEqual(a.string(), b.string())

    def test_reg_as_zero(self):
        """Assert as 0 if given though '=' op or asm.mov()
        """
        asm.ax = 0
        asm.mov(rex.ax, '0h')

        items = asm.lines()
        assert items[0].string() == items[1].string()

        asm.mov(reg.dx, reg.ax).string()
        "mov   ds, ax"

    def reg_position():
        # top half of eax
        reg.ax.extra + reg.ax == reg.eax
        reg.ah + reg.al == reg.ax
