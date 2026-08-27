from ignis import utils, widgets
from ignis.services.audio import AudioService

audio_service = AudioService.get_default()


class VolumeOSD(widgets.RevealerWindow):
    def __init__(self):
        self._revealer = widgets.Revealer(
            transition_type="crossfade",
            transition_duration=200,
            child=widgets.Box(
                css_classes=["volume-osd-container"],
                child=[
                    widgets.Icon(
                        pixel_size=24, image=audio_service.speaker.bind("icon_name")
                    ),
                    widgets.Scale(
                        value=audio_service.speaker.bind_many(
                            ["volume", "is_muted"],
                            lambda volume, is_muted: (
                                0 if is_muted or volume is None else volume
                            ),
                        ),
                        css_classes=["volume-osd-scale"],
                        sensitive=False,
                    ),
                ],
            ),
        )
        super().__init__(
            namespace="shell-volume-osd",
            layer="overlay",
            anchor=["bottom"],
            visible=False,
            revealer=self._revealer,
            css_classes=[
                "volume-osd-revealerwindow"
            ],  # I think this unsets any other CSS classes and makes it transparent, which is what I want for the crossfade animation
            child=widgets.Box(child=[self._revealer]),
        )
        audio_service.speaker.connect("notify::volume", lambda *_: self.toggle())

    def toggle(self) -> None:
        self.set_property("visible", True)
        self.__hide()

    @utils.debounce(3000)
    def __hide(self) -> None:
        self.set_property("visible", False)
