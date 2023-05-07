import ImageLogo from "./images/logo.jpeg";
import NoImage from "./images/no-image.png";
import Image1683259219210png from "./images/1683259219210.png";
import Image1683261192698png from "./images/1683261192698.png";
import Image1683261192898png from "./images/1683261192898.png";
import Image1683261286543png from "./images/1683261286543.png";
const assets = (name: string) => {
  switch (name) {
    case "logo":
      return ImageLogo;
    case "1683259219210png":
      return Image1683259219210png;
    case "1683261192698png":
      return Image1683261192698png;
    case "1683261192898png":
      return Image1683261192898png;
    case "1683261286543png":
      return Image1683261286543png;
    default:
      return NoImage;
  }
};
export default assets;
