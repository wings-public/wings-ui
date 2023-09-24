<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_DrawPedigree.ascx.cs" Inherits="WebGAP.PhenBook.PopUp.uc_DrawPedigree" %>

<!DOCTYPE html>
<html>



<telerik:RadCodeBlock runat="server" ID="rcb1">
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function btn_cacel_click() {
            GetRadWindow().close();
        }
    </script>
</telerik:RadCodeBlock>
<body onload="init()">
    <%--   <div id="sample">
        <div style="display: inline-block;">--%>
    <div style="position: relative;">
        <script src="../../assets/js/go.js"></script>
        <asp:HiddenField ID="Txt_PVal" runat="server" />


        <div class="content-body pt-1">
            <section id="basic-form-layouts">
                <div class="row match-height">
                   
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="form">
                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-user"></i>Family Pedigree</h4>
                                            <div id="myDiagramDiv" style="border: solid 1px black; height: 550px">
                                                <asp:Label runat="server" ID="lbl_Feedback" Visible="false" ForeColor="Gray" Font-Size="Medium" CssClass="lbl_FeedBack" Text="No Pedigree to Display"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actionspopup center" style="height: 20%">
                                <asp:Button ID="btn_cacel" Text="Close" runat="server" CausesValidation="true" class="btn btn-danger mr-1 ladda-button btn-sm" OnClientClick="btn_cacel_click();return false;"></asp:Button>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </div>
    </div>
</body>
</html>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script>
  
        function pageLoad() {
            var W = $(document).width();

            if (W > 750) {
                document.getElementById("myDiagramDiv").style.width = "690px";
            }
            else
                document.getElementById("myDiagramDiv").style.width = "750px";
        }

        var myDiagram;
        function init() {

            var datass = document.getElementById('<%= Txt_PVal.ClientID%>').value;

            var parsedjason = jQuery.parseJSON(datass);
            var $ = go.GraphObject.make;
            myDiagram =
                $(go.Diagram, "myDiagramDiv",
                    {
                        initialAutoScale: go.Diagram.Uniform,
                        initialContentAlignment: go.Spot.Center,
                        // when a node is selected, draw a big yellow circle behind it
                        nodeSelectionAdornmentTemplate:
                            $(go.Adornment, "Auto",
                                { layerName: "Grid" },  // the predefined layer that is behind everything else
                                $(go.Shape, "Circle", { fill: "#fee090", stroke: null }),
                                $(go.Placeholder)
                            ),
                        layout:  // use a custom layout, defined below
                            $(GenogramLayout, { direction: 90, layerSpacing: 30, columnSpacing: 10 })
                    });
            // determine the color for each attribute shape
            function attrFill(a) {
                switch (a) {
                    case "ATL": return "green";
                    case "ATR": return "green";
                    case "ABR": return "green";
                    case "ABL": return "green";
                    case "BTL": return "orange";
                    case "BTR": return "orange";
                    case "BBR": return "orange";
                    case "BBL": return "orange";
                    case "CTL": return "red";
                    case "CTR": return "red";
                    case "CBR": return "red";
                    case "CBL": return "red";
                    case "DTL": return "cyan";
                    case "DTR": return "cyan";
                    case "DBR": return "cyan";
                    case "DBL": return "cyan";
                    case "ETL": return "gold";
                    case "ETR": return "gold";
                    case "EBR": return "gold";
                    case "EBL": return "gold";
                    case "FTL": return "pink";
                    case "FTR": return "pink";
                    case "FBR": return "pink";
                    case "FBL": return "pink";
                    case "GTL": return "blue";
                    case "GTR": return "blue";
                    case "GBR": return "blue";
                    case "GBL": return "blue";
                    case "HTL": return "brown";
                    case "HTR": return "brown";
                    case "HBR": return "brown";
                    case "HBL": return "brown";
                    case "ITL": return "purple";
                    case "ITR": return "purple";
                    case "IBR": return "purple";
                    case "IBL": return "purple";
                    case "JTL": return "chartreuse";
                    case "JTR": return "chartreuse";
                    case "JBR": return "chartreuse";
                    case "JBL": return "chartreuse";
                    case "KTL": return "lightgray";
                    case "KTR": return "lightgray";
                    case "KBR": return "lightgray";
                    case "KBL": return "lightgray";
                    case "LTL": return "magenta";
                    case "LTR": return "magenta";
                    case "LBR": return "magenta";
                    case "LBL": return "magenta";
                    case "AS": return "red";


                    default: return "transparent";
                }
            }
            // determine the geometry for each attribute shape in a male;
            // except for the slash these are all squares at each of the four corners of the overall square
            var tlsq = go.Geometry.parse("F M1 1 l19 0 0 19 -19 0z");
            var trsq = go.Geometry.parse("F M20 1 l19 0 0 19 -19 0z");
            var brsq = go.Geometry.parse("F M20 20 l19 0 0 19 -19 0z");
            var blsq = go.Geometry.parse("F M1 20 l19 0 0 19 -19 0z");
            var slash = go.Geometry.parse("F M38 0 L40 0 40 2 2 40 0 40 0 38z");
            function maleGeometry(a) {
                switch (a) {
                    case "ATL": return tlsq;
                    case "ATR": return trsq;
                    case "ABR": return brsq;
                    case "ABL": return blsq;
                    case "BTL": return tlsq;
                    case "BTR": return trsq;
                    case "BBR": return brsq;
                    case "BBL": return blsq;
                    case "CTL": return tlsq;
                    case "CTR": return trsq;
                    case "CBR": return brsq;
                    case "CBL": return blsq;
                    case "DTL": return tlsq;
                    case "DTR": return trsq;
                    case "DBR": return brsq;
                    case "DBL": return blsq;
                    case "ETL": return tlsq;
                    case "ETR": return trsq;
                    case "EBR": return brsq;
                    case "EBL": return blsq;
                    case "GTL": return tlsq;
                    case "GTR": return trsq;
                    case "GBR": return brsq;
                    case "GBL": return blsq;
                    case "FTL": return tlsq;
                    case "FTR": return trsq;
                    case "FBR": return brsq;
                    case "FBL": return blsq;
                    case "HTL": return tlsq;
                    case "HTR": return trsq;
                    case "HBR": return brsq;
                    case "HBL": return blsq;
                    case "ITL": return tlsq;
                    case "ITR": return trsq;
                    case "IBR": return brsq;
                    case "IBL": return blsq;
                    case "JTL": return tlsq;
                    case "JTR": return trsq;
                    case "JBR": return brsq;
                    case "JBL": return blsq;
                    case "KTL": return tlsq;
                    case "KTR": return trsq;
                    case "KBR": return brsq;
                    case "KBL": return blsq;
                    case "LTL": return tlsq;
                    case "LTR": return trsq;
                    case "LBR": return brsq;
                    case "LBL": return blsq;
                    case "AS": return slash;
                    default: return tlsq;
                }
            }
            // determine the geometry for each attribute shape in a female;
            // except for the slash these are all pie shapes at each of the four quadrants of the overall circle
            var tlarc = go.Geometry.parse("F M20 20 B 180 90 20 20 19 19 z");
            var trarc = go.Geometry.parse("F M20 20 B 270 90 20 20 19 19 z");
            var brarc = go.Geometry.parse("F M20 20 B 0 90 20 20 19 19 z");
            var blarc = go.Geometry.parse("F M20 20 B 90 90 20 20 19 19 z");
            function femaleGeometry(a) {
                switch (a) {

                    case "ATL": return tlarc;
                    case "ATR": return trarc;
                    case "ABR": return brarc;
                    case "ABL": return blarc;
                    case "BTL": return tlarc;
                    case "BTR": return trarc;
                    case "BBR": return brarc;
                    case "BBL": return blarc;
                    case "CTL": return tlarc;
                    case "CTR": return trarc;
                    case "CBR": return brarc;
                    case "CBL": return blarc;
                    case "DTL": return tlarc;
                    case "DTR": return trarc;
                    case "DBR": return brarc;
                    case "DBL": return blarc;
                    case "ETL": return tlarc;
                    case "ETR": return trarc;
                    case "EBR": return brarc;
                    case "EBL": return blarc;
                    case "GTL": return tlarc;
                    case "GTR": return trarc;
                    case "GBR": return brarc;
                    case "GBL": return blarc;
                    case "FTL": return tlarc;
                    case "FTR": return trarc;
                    case "FBR": return brarc;
                    case "FBL": return blarc;
                    case "HTL": return tlarc;
                    case "HTR": return trarc;
                    case "HBR": return brarc;
                    case "HBL": return blarc;
                    case "ITL": return tlarc;
                    case "ITR": return trarc;
                    case "IBR": return brarc;
                    case "IBL": return blarc;
                    case "JTL": return tlarc;
                    case "JTR": return trarc;
                    case "JBR": return brarc;
                    case "JBL": return blarc;
                    case "KTL": return tlarc;
                    case "KTR": return trarc;
                    case "KBR": return brarc;
                    case "KBL": return blarc;
                    case "LTL": return tlarc;
                    case "LTR": return trarc;
                    case "LBR": return brarc;
                    case "LBL": return blarc;
                    case "AS": return slash;
                    default: return tlarc;
                }
            }
            // two different node templates, one for each sex,
            // named by the category value in the node data object

            myDiagram.nodeTemplateMap.add("U",  // Unknown
                $(go.Node, "Vertical",
                    { locationSpot: go.Spot.Center, locationObjectName: "ICON" },
                    $(go.Panel,
                        { name: "ICON" },
                        $(go.Shape, "Diamond",
                            { width: 40, height: 40, strokeWidth: 2, fill: "white", portId: "" }),
                        $(go.Panel,
                            { // for each attribute show a Shape at a particular place in the overall square
                                itemTemplate:
                                    $(go.Panel,
                                        $(go.Shape,
                                            { stroke: null, strokeWidth: 0 },
                                            new go.Binding("fill", "", attrFill),
                                            new go.Binding("geometry", "", maleGeometry))
                                    ),
                                margin: 1
                            },
                            new go.Binding("itemArray", "a")
                        )
                    ),
                    $(go.TextBlock,
                        { textAlign: "center", maxSize: new go.Size(80, NaN) },
                        new go.Binding("text", "n"))
                ));


            myDiagram.nodeTemplateMap.add("M",  // male
                $(go.Node, "Vertical",
                    { locationSpot: go.Spot.Center, locationObjectName: "ICON" },
                    $(go.Panel,
                        { name: "ICON" },
                        $(go.Shape, "Square",
                            { width: 40, height: 40, strokeWidth: 2, fill: "white", portId: "" }),
                        $(go.Panel,
                            { // for each attribute show a Shape at a particular place in the overall square
                                itemTemplate:
                                    $(go.Panel,
                                        $(go.Shape,
                                            { stroke: null, strokeWidth: 0 },
                                            new go.Binding("fill", "", attrFill),
                                            new go.Binding("geometry", "", maleGeometry))
                                    ),
                                margin: 1
                            },
                            new go.Binding("itemArray", "a")
                        )
                    ),
                    $(go.TextBlock,
                        { textAlign: "center", maxSize: new go.Size(80, NaN) },
                        new go.Binding("text", "n"))
                ));
            myDiagram.nodeTemplateMap.add("F",  // female
                $(go.Node, "Vertical",
                    { locationSpot: go.Spot.Center, locationObjectName: "ICON" },
                    $(go.Panel,
                        { name: "ICON" },
                        $(go.Shape, "Circle",
                            { width: 40, height: 40, strokeWidth: 2, fill: "white", portId: "" }),
                        $(go.Panel,
                            { // for each attribute show a Shape at a particular place in the overall circle
                                itemTemplate:
                                    $(go.Panel,
                                        $(go.Shape,
                                            { stroke: null, strokeWidth: 0 },
                                            new go.Binding("fill", "", attrFill),
                                            new go.Binding("geometry", "", femaleGeometry))
                                    ),
                                margin: 1
                            },
                            new go.Binding("itemArray", "a")
                        )
                    ),
                    $(go.TextBlock,
                        { textAlign: "center", maxSize: new go.Size(80, NaN) },
                        new go.Binding("text", "n"))
                ));
            // the representation of each label node -- nothing shows on a Marriage Link
            myDiagram.nodeTemplateMap.add("LinkLabel",
                $(go.Node, { selectable: false, width: 1, height: 1, fromEndSegmentLength: 20 }));
            myDiagram.linkTemplate =  // for parent-child relationships
                $(go.Link,
                    {
                        routing: go.Link.Orthogonal, curviness: 10,
                        layerName: "Background", selectable: false,
                        fromSpot: go.Spot.Bottom, toSpot: go.Spot.Top
                    },
                    $(go.Shape, { strokeWidth: 2 })
                );
            myDiagram.linkTemplateMap.add("Marriage",  // for marriage relationships
                $(go.Link, { selectable: false },
                    $(go.Shape, { strokeWidth: 2, stroke: "darkgreen" })
                ));
            // n: name, s: sex, m: mother, f: father, ux: wife, vir: husband, a: attributes/markers

            //parsedjason.forEach(function (d) {
            //    console.log(d);
            //})

            //   console.log(parsedjason.d);
            setupDiagram(myDiagram, parsedjason.d
                 /* focus on this person */);//,2
        }
        // create and initialize the Diagram.model given an array of node data representing people
        function setupDiagram(diagram, array) {//, focusId
            //    console.log("Inside");
            //    console.log(array);
            diagram.model =
                go.GraphObject.make(go.GraphLinksModel,
                    { // declare support for link label nodes
                        linkLabelKeysProperty: "labelKeys",
                        // this property determines which template is used
                        nodeCategoryProperty: "s",
                        // create all of the nodes for people
                        nodeDataArray: array
                    });
            setupMarriages(diagram);
            setupParents(diagram);
            //var node = diagram.findNodeForKey(focusId);
            //if (node !== null) {
            //    diagram.select(node);
            //    node.linksConnected.each(function (l) {
            //        if (!l.isLabeledLink) return;
            //        l.opacity = 0;
            //        var spouse = l.getOtherNode(node);
            //        spouse.opacity = 0;
            //        spouse.pickable = false;
            //    });
            //   }

           
          
        }
        function findMarriage(diagram, a, b) {  // A and B are node keys
            var nodeA = diagram.findNodeForKey(a);
            var nodeB = diagram.findNodeForKey(b);
            if (nodeA !== null && nodeB !== null) {
                var it = nodeA.findLinksBetween(nodeB);  // in either direction
                while (it.next()) {
                    var link = it.value;
                    // Link.data.category === "Marriage" means it's a marriage relationship
                    if (link.data !== null && link.data.category === "Marriage") return link;
                }
            }
            return null;
        }
        // now process the node data to determine marriages
        function setupMarriages(diagram) {
            var model = diagram.model;
            var nodeDataArray = model.nodeDataArray;
            for (var i = 0; i < nodeDataArray.length; i++) {
                var data = nodeDataArray[i];
                var key = data.key;
                var uxs = data.ux;
                if (uxs !== undefined) {
                    if (typeof uxs === "number") uxs = [uxs];
                    for (var j = 0; j < uxs.length; j++) {
                        var wife = uxs[j];
                        if (key === wife) {
                            // or warn no reflexive marriages
                            continue;
                        }
                        var link = findMarriage(diagram, key, wife);
                        if (link === null) {
                            // add a label node for the marriage link
                            var mlab = { s: "LinkLabel" };
                            model.addNodeData(mlab);
                            // add the marriage link itself, also referring to the label node
                            var mdata = { from: key, to: wife, labelKeys: [mlab.key], category: "Marriage" };
                            model.addLinkData(mdata);
                        }
                    }
                }
                var virs = data.vir;
                if (virs !== undefined) {
                    if (typeof virs === "number") virs = [virs];
                    for (var j = 0; j < virs.length; j++) {
                        var husband = virs[j];
                        if (key === husband) {
                            // or warn no reflexive marriages
                            continue;
                        }
                        var link = findMarriage(diagram, key, husband);
                        if (link === null) {
                            // add a label node for the marriage link
                            var mlab = { s: "LinkLabel" };
                            model.addNodeData(mlab);
                            // add the marriage link itself, also referring to the label node
                            var mdata = { from: key, to: husband, labelKeys: [mlab.key], category: "Marriage" };
                            model.addLinkData(mdata);
                        }
                    }
                }
            }
        }
        // process parent-child relationships once all marriages are known
        function setupParents(diagram) {
            var model = diagram.model;
            var nodeDataArray = model.nodeDataArray;
            for (var i = 0; i < nodeDataArray.length; i++) {
                var data = nodeDataArray[i];
                var key = data.key;
                var mother = data.m;
                var father = data.f;
                if (mother !== undefined && father !== undefined) {
                    var link = findMarriage(diagram, mother, father);
                    if (link === null) {
                        // or warn no known mother or no known father or no known marriage between them
                        if (window.console) window.console.log("unknown marriage: " + mother + " & " + father);
                        continue;
                    }
                    var mdata = link.data;
                    var mlabkey = mdata.labelKeys[0];
                    var cdata = { from: mlabkey, to: key };
                    myDiagram.model.addLinkData(cdata);
                }
            }
        }
        // A custom layout that shows the two families related to a person's parents
        function GenogramLayout() {
            go.LayeredDigraphLayout.call(this);
            this.initializeOption = go.LayeredDigraphLayout.InitDepthFirstIn;
        }
        go.Diagram.inherit(GenogramLayout, go.LayeredDigraphLayout);
        /** @override */
        GenogramLayout.prototype.makeNetwork = function (coll) {
            // generate LayoutEdges for each parent-child Link
            var net = this.createNetwork();
            if (coll instanceof go.Diagram) {
                this.add(net, coll.nodes, true);
                this.add(net, coll.links, true);
            } else if (coll instanceof go.Group) {
                this.add(net, coll.memberParts, false);
            } else if (coll.iterator) {
                this.add(net, coll.iterator, false);
            }
            return net;
        };
        // internal method for creating LayeredDigraphNetwork where husband/wife pairs are represented
        // by a single LayeredDigraphVertex corresponding to the label Node on the marriage Link
        GenogramLayout.prototype.add = function (net, coll, nonmemberonly) {
            // consider all Nodes in the given collection
            var it = coll.iterator;
            while (it.next()) {
                var node = it.value;
                if (!(node instanceof go.Node)) continue;
                if (!node.isLayoutPositioned || !node.isVisible()) continue;
                if (nonmemberonly && node.containingGroup !== null) continue;
                // if it's an unmarried Node, or if it's a Link Label Node, create a LayoutVertex for it
                if (node.isLinkLabel) {
                    // get marriage Link
                    var link = node.labeledLink;
                    var spouseA = link.fromNode;
                    var spouseB = link.toNode;
                    // create vertex representing both husband and wife
                    var vertex = net.addNode(node);
                    // now define the vertex size to be big enough to hold both spouses
                    vertex.width = spouseA.actualBounds.width + 30 + spouseB.actualBounds.width;
                    vertex.height = Math.max(spouseA.actualBounds.height, spouseB.actualBounds.height);
                    vertex.focus = new go.Point(spouseA.actualBounds.width + 30 / 2, vertex.height / 2);
                } else {
                    // don't add a vertex for any married person!
                    // instead, code above adds label node for marriage link
                    // assume a marriage Link has a label Node
                    if (!node.linksConnected.any(function (l) { return l.isLabeledLink; })) {
                        var vertex = net.addNode(node);
                    }
                }
            }
            // now do all Links
            it.reset();
            while (it.next()) {
                var link = it.value;
                if (!(link instanceof go.Link)) continue;
                if (!link.isLayoutPositioned || !link.isVisible()) continue;
                if (nonmemberonly && link.containingGroup !== null) continue;
                // if it's a parent-child link, add a LayoutEdge for it
                if (!link.isLabeledLink) {
                    var parent = net.findVertex(link.fromNode);  // should be a label node
                    var child = net.findVertex(link.toNode);
                    if (child !== null) {  // an unmarried child
                        net.linkVertexes(parent, child, link);
                    } else {  // a married child
                        link.toNode.linksConnected.each(function (l) {
                            if (!l.isLabeledLink) return;  // if it has no label node, it's a parent-child link
                            // found the Marriage Link, now get its label Node
                            var mlab = l.labelNodes.first();
                            // parent-child link should connect with the label node,
                            // so the LayoutEdge should connect with the LayoutVertex representing the label node
                            var mlabvert = net.findVertex(mlab);
                            if (mlabvert !== null) {
                                net.linkVertexes(parent, mlabvert, link);
                            }
                        });
                    }
                }
            }
        };
        /** @override */
        GenogramLayout.prototype.assignLayers = function () {
            go.LayeredDigraphLayout.prototype.assignLayers.call(this);
            var horiz = this.direction == 0.0 || this.direction == 180.0;
            // for every vertex, record the maximum vertex width or height for the vertex's layer
            var maxsizes = [];
            this.network.vertexes.each(function (v) {
                var lay = v.layer;
                var max = maxsizes[lay];
                if (max === undefined) max = 0;
                var sz = (horiz ? v.width : v.height);
                if (sz > max) maxsizes[lay] = sz;
            });
            // now make sure every vertex has the maximum width or height according to which layer it is in,
            // and aligned on the left (if horizontal) or the top (if vertical)
            this.network.vertexes.each(function (v) {
                var lay = v.layer;
                var max = maxsizes[lay];
                if (horiz) {
                    v.focus = new go.Point(0, v.height / 2);
                    v.width = max;
                } else {
                    v.focus = new go.Point(v.width / 2, 0);
                    v.height = max;
                }
            });
            // from now on, the LayeredDigraphLayout will think that the Node is bigger than it really is
            // (other than the ones that are the widest or tallest in their respective layer).
        };
        /** @override */
        GenogramLayout.prototype.commitNodes = function () {
            go.LayeredDigraphLayout.prototype.commitNodes.call(this);
            // position regular nodes
            this.network.vertexes.each(function (v) {
                if (v.node !== null && !v.node.isLinkLabel) {
                    v.node.position = new go.Point(v.x, v.y);
                }
            });
            // position the spouses of each marriage vertex
            var layout = this;
            this.network.vertexes.each(function (v) {
                if (v.node === null) return;
                if (!v.node.isLinkLabel) return;
                var labnode = v.node;
                var lablink = labnode.labeledLink;
                // In case the spouses are not actually moved, we need to have the marriage link
                // position the label node, because LayoutVertex.commit() was called above on these vertexes.
                // Alternatively we could override LayoutVetex.commit to be a no-op for label node vertexes.
                lablink.invalidateRoute();
                var spouseA = lablink.fromNode;
                var spouseB = lablink.toNode;
                // prefer fathers on the left, mothers on the right
                if (spouseA.data.s === "F") {  // sex is female
                    var temp = spouseA;
                    spouseA = spouseB;
                    spouseB = temp;
                }
                // see if the parents are on the desired sides, to avoid a link crossing
                var aParentsNode = layout.findParentsMarriageLabelNode(spouseA);
                var bParentsNode = layout.findParentsMarriageLabelNode(spouseB);
                if (aParentsNode !== null && bParentsNode !== null && aParentsNode.position.x > bParentsNode.position.x) {
                    // swap the spouses
                    var temp = spouseA;
                    spouseA = spouseB;
                    spouseB = temp;
                }
                spouseA.position = new go.Point(v.x, v.y);
                spouseB.position = new go.Point(v.x + spouseA.actualBounds.width + 30, v.y);
                if (spouseA.opacity === 0) {
                    var pos = new go.Point(v.centerX - spouseA.actualBounds.width / 2, v.y);
                    spouseA.position = pos;
                    spouseB.position = pos;
                } else if (spouseB.opacity === 0) {
                    var pos = new go.Point(v.centerX - spouseB.actualBounds.width / 2, v.y);
                    spouseA.position = pos;
                    spouseB.position = pos;
                }
            });
        };
        GenogramLayout.prototype.findParentsMarriageLabelNode = function (node) {
            var it = node.findNodesInto();
            while (it.next()) {
                var n = it.value;
                if (n.isLinkLabel) return n;
            }
            return null;
        };
        // end GenogramLayout class

    </script>
</telerik:RadScriptBlock>


