from os import path

from ignis import utils
from ignis.css_manager import CssInfoPath, CssManager

from modules.osd.osd import VolumeOSD

css_manager = CssManager.get_default()

css_manager.apply_css(
    CssInfoPath(
        name="main",
        path=path.join(utils.get_current_dir(), "style.css"),
        priority="user",
    )
)

VolumeOSD()
