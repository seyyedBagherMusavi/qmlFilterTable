import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1
import QtQuick.XmlListModel 2.0
import SortFilterProxyModel 1.0
import QtQuick.Controls 1.4 as Quick

ApplicationWindow {
    id: window

    width: 640
    height: 360
    visible: true
    title: qsTr("Source: %1").arg(comboBox.currentText)

    toolBar: ToolBar {
        ComboBox {
            id: comboBox

            model: [qsTr("Persons"), qsTr("Books")]
            anchors.verticalCenter: parent.verticalCenter
        }

        TextField {
            id: searchBox

            width: window.width / 3
            placeholderText: qsTr("Search...")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
        }
    }

    SortFilterProxyModel{
        id: proxyModel
        //source: sourceModel.count > 0 ? sourceModel : null
        source: sourceModel;//targetmodel.data()
        //sourceModel: targetmodel

        sortOrder: tableView.sortIndicatorOrder
        sortCaseSensitivity: Qt.CaseInsensitive
        sortRole: sourceModel.count > 0 ? tableView.getColumn(tableView.sortIndicatorColumn).role : ""

        filterString: "*" + searchBox.text + "*"
        filterSyntax: SortFilterProxyModel.Wildcard
        filterCaseSensitivity: Qt.CaseInsensitive
    }


    SplitView {
        anchors.fill: parent
        //width: window.width
        //height: window.height
        TableView {
            id: tableView
            width: parent.width/2
            height: parent.height
            //frameVisible: false
            sortIndicatorVisible: true
            Layout.minimumWidth: 300
            Layout.minimumHeight: 240
            Layout.preferredWidth: 600
            Layout.preferredHeight: 400
            /*
            headerDelegate: Rectangle {
        height: 18
        color: "#2883ad"

        Rectangle {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            anchors.topMargin: 1
            width: 1
            color: "#333"
        }
        Text {
            text: styleData.value
            color: "#CFF"
            width: parent.width
            height: parent.height
            font.pointSize: 10
            minimumPointSize: 3
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

    }
//*/

            TableViewColumn {
                id: idColumn
                title: "Id"
                role: "Id"
                //movable: false
                //resizable: false
                width: 40
            }
            TableViewColumn {
                id: fNameColumn
                title: "FName"
                role: "FName"
                //movable: false
                //resizable: false
                width: 40
            }
            TableViewColumn {
                id: lNameColumn
                title: "LName"
                role: "LName"
                //movable: false
                //resizable: false
                width: 50
            }
            TableViewColumn {
                id: proffessionColumn
                title: "Proffession"
                role: "Proffession"
                //movable: false
                //resizable: false
                width: 40
            }
            TableViewColumn {
                id: countryColumn
                title: "Country"
                role: "Country"
                //movable: false
                //resizable: false
                width: 40
            }
            TableViewColumn {
                id: cityColumn
                title: "City"
                role: "City"
                //movable: false
                //resizable: false
                width: 40
            }
            TableViewColumn {
                id: ageColumn
                title: "Age"
                role: "Age"
                //movable: false
                //resizable: false
                width: 25
            }
            TableViewColumn {
                id: maritalStatusColumn
                title: "MaritalStatus"
                role: "MaritalStatus"
                //movable: false
                //resizable: false
                width: 30
            }
            model: proxyModel
            //model : TableModel
            onClicked: {
                //var x = tableView.currentRow.toString();
                //var index = sourceModel.get(tableView.currentRow).Id
                //var u =  proxyModel.get(row).Id
                dispInfoItem.updateInfo(row);
                //console.log("index:"+index)
            }
        }
        Item{
            id : dispInfoItem
            width: window.width/2
            height: window.height/2

            //anchors.horizontalCenter: parent.horizontalCenter
            property int d : 30;
            Label{text: "Id:           "; width:50;height :parent.d;x:50;y : 20 + 0*parent.d;font.pixelSize: 10}
            Label{text: "First Name:   "; width:50;height :parent.d;x:50;y : 20 + 1*parent.d;font.pixelSize: 10}
            Label{text: "Last  Name:   "; width:50;height :parent.d;x:50;y : 20 + 2*parent.d;font.pixelSize: 10}
            Label{text: "Proffession:  "; width:50;height :parent.d;x:50;y : 20 + 3*parent.d;font.pixelSize: 10}
            Label{text: "Country:      "; width:50;height :parent.d;x:50;y : 20 + 4*parent.d;font.pixelSize: 10}
            Label{text: "City:         "; width:50;height :parent.d;x:50;y : 20 + 5*parent.d;font.pixelSize: 10}
            Label{text: "Age:          "; width:50;height :parent.d;x:50;y : 20 + 6*parent.d;font.pixelSize: 10}
            Label{text: "MaritalStatus:"; width:50;height :parent.d;x:50;y : 20 + 7*parent.d;font.pixelSize: 10}

            Text{text: "";id:txtId           ; width:50;height :parent.d;x:150;y : 20 + 0*parent.d;font.pixelSize: 10}
            Text{text: "";id:txtFName        ; width:50;height :parent.d;x:150;y : 20 + 1*parent.d;font.pixelSize: 10}
            Text{text: "";id:txtLName        ; width:50;height :parent.d;x:150;y : 20 + 2*parent.d;font.pixelSize: 10}
            Text{text: "";id:txtProffession  ; width:50;height :parent.d;x:150;y : 20 + 3*parent.d;font.pixelSize: 10}
            Text{text: "";id:txtCountry      ; width:50;height :parent.d;x:150;y : 20 + 4*parent.d;font.pixelSize: 10}
            Text{text: "";id:txtCity         ; width:50;height :parent.d;x:150;y : 20 + 5*parent.d;font.pixelSize: 10}
            Text{text: "";id:txtAge          ; width:50;height :parent.d;x:150;y : 20 + 6*parent.d;font.pixelSize: 10}
            Text{text: "";id:txtMaritalStatus; width:50;height :parent.d;x:150;y : 20 + 7*parent.d;font.pixelSize: 10}

            function updateInfo(row){
                txtId.text             = proxyModel.get(row).Id
                txtFName.text          = proxyModel.get(row).FName
                txtLName.text          = proxyModel.get(row).LName
                txtProffession.text    = proxyModel.get(row).Proffession
                txtCountry.text        = proxyModel.get(row).Country
                txtCity.text           = proxyModel.get(row).City
                txtAge.text            = proxyModel.get(row).Age
                txtMaritalStatus.text  = proxyModel.get(row).MaritalStatus
            }
        }
    }
    //==== DATA =============================================================
    ListModel {
        id: sourceModel
        Component.onCompleted: {
            for (var i = 0; i < 20000; i++) {
                sourceModel.append(createListElement(i));
                //sourceModel.get(i).FName = 10.95;
            }

        }

        function createListElement(i) {
            return {
                "Id"   : i,
                "FName": "FN"+i+"|"+randStr(1),
                "LName": "LN"+randStr(7),
                "Proffession": "P"+randStr(5),
                "Country": "Con"+randStr(3),
                "City": "Ci"+randStr(3),
                "Age": randInt(120),
                "MaritalStatus": (randInt(2)==="0")?"married":"single"
            };
        }
        function randStr(length) {
            var result           = '';
            var characters       = 'abcdefghijklmnopqrstuvwxyz';
            var charactersLength = characters.length;
            for ( var i = 0; i < length; i++ ) {
                result += characters.charAt(Math.floor(Math.random() * charactersLength));
            }
            return result;
        }
        function randInt(length) {
            return Math.floor(Math.random()*length).toString();
            //.replace(/[0-9]/g, '')
        }
    }

}
