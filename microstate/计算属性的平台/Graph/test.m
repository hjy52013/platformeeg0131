NumberOfNodes = 90; % Number of nodes
Alpha = -2.2;   % Alpha of the scale-free graph
%define node degree distribution:
XAxis  = unique(round(logspace(0,log10(NumberOfNodes),25)));
YAxis  = unique(round(logspace(0,log10(NumberOfNodes),25))).^(Alpha+1);
% create the graph with the required node degree distribution:
Graph = mexGraphCreateRandomGraph(NumberOfNodes,XAxis,YAxis,1);

