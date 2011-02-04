
import Qt 4.7

import 'config.js' as Config

SelectableItem {
    id: podcastItem

    Text {
        id: counterText
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.rightMargin: 5
        text: (model.podcast.qdownloaded)?(''+model.podcast.qdownloaded):('')
        color: "white"
        width: Config.iconSize * 1.5 // FIXME
        font.pixelSize: podcastItem.height * .6
        horizontalAlignment: Text.AlignRight
    }

    ScaledImage {
    	id: cover
        source: 'podcastList/cover-shadow.png'

        anchors {
            verticalCenter: parent.verticalCenter
            left: counterText.right
            leftMargin: Config.smallSpacing
        }

        Image {
            source: model.podcast.qcoverfile
            width: parent.width * .8
            height: parent.height * .8
            sourceSize.width: width
            sourceSize.height: height
            anchors.centerIn: parent
        }
    }

    Column {
        id: titleBox

        anchors {
            verticalCenter: parent.verticalCenter
            left: cover.right
            leftMargin: Config.smallSpacing
            right: parent.right
            rightMargin: Config.smallSpacing
        }

        ShadowText {
            id: titleText
            text: model.podcast.qtitle
            color: "white"
            anchors {
                left: parent.left
                right: parent.right
            }
            font.pixelSize: podcastItem.height * .35
        }

        ShadowText {
            id: descriptionText
            text: model.podcast.qupdating?"UPDATING...":modelData.qdescription
            visible: text != ''
            color: "#aaa"
            offsetX: -1
            offsetY: -1
            anchors {
                left: parent.left
                right: parent.right
            }
            font.pixelSize: podcastItem.height * .25
        }
    }
}
