%{
BEN HESKETH
LIVERPOOL HOPE UNIVERSITY
ADVANCED COMPUTER SCIENCE
A.I. IMPLEMENTATION - S. H. I. E. L. D.
%}

genFirstDSKMeans()
%=========================================================================
function genFirstDSKMeans()
    rng default;
    % First generated dataset (S. H. I.)
    SierraSet = 2*[randn(150,1)+1,randn(150,1)+1];
    HotelSet = 2*[randn(150,1)+2,randn(150,1)+2]; 
    IndiaSet = 2*[randn(150,1)+3,randn(150,1)+3]; 
    shi_data = [SierraSet; HotelSet; IndiaSet];
    fprintf("rows: %g \ncolumns: %g \n S. H. I.\n\n", size(shi_data));
    %result is rows and columns

    %clustering
    [firstSet,C] = kmeans(shi_data, 3);
    figure('Name','K Means');
    gscatter(shi_data(:,1),shi_data(:,2),firstSet,'rbm')
    hold on
    plot(C(:,1),C(:,2),'kx');
    legend('Sierra','Hotel', 'India', 'X Centorids')

%=========================================================================
    %new generated dataset (E. L. D.)
    EchoSet = 2*[randn(25,1)+1,randn(25,1)+1];
    LimaSet = 2*[randn(25,1)+2,randn(25,1)+2]; 
    DeltaSet = 2*[randn(25,1)+3,randn(25,1)+3];
    eld_data = [EchoSet; LimaSet; DeltaSet];
    fprintf("rows: %g \ncolumns: %g \n E. L. D.\n\n", size(eld_data));

    %{
    Classifies new dataset from using the current clusters.
    Searches for nearest centroid from every data point using "pdist2".
    "pdist2 is needed to assign new datasets to these clusters.
    %}

    [~,class_new] = pdist2(C,eld_data,'euclidean','Smallest',1);
        
    gscatter(eld_data(:,1),eld_data(:,2),class_new,'rbm','ooo')
    legend('Sierra','Hotel', 'India', 'X Centorids','Echo','Lima','Delta')
%=========================================================================

    genFirstDSKMedoids()
    %=========================================================================
    function genFirstDSKMedoids()
        rng default;
        % First generated dataset (S. H. I.)
        SierraSet = 2*[randn(150,1)+1,randn(150,1)+1];
        HotelSet = 2*[randn(150,1)+2,randn(150,1)+2]; 
        IndiaSet = 2*[randn(150,1)+3,randn(150,1)+3]; 
        shi_data = [SierraSet; HotelSet; IndiaSet];
        fprintf("rows: %g \ncolumns: %g \n S. H. I.\n\n", size(shi_data));
        %result is rows and columns
    
        %clustering
        [firstSet,C] = kmedoids(shi_data, 3);
        figure('Name','kmedoids');
        gscatter(shi_data(:,1),shi_data(:,2),firstSet,'rbm')
        hold on
        plot(C(:,1),C(:,2),'kx');
        legend('Sierra','Hotel', 'India', 'X Centorids')
    
    %=========================================================================
        %new generated dataset (E. L. D.)
        EchoSet = 2*[randn(25,1)+1,randn(25,1)+1];
        LimaSet = 2*[randn(25,1)+2,randn(25,1)+2]; 
        DeltaSet = 2*[randn(25,1)+3,randn(25,1)+3];
        eld_data = [EchoSet; LimaSet; DeltaSet];
        fprintf("rows: %g \ncolumns: %g \n E. L. D.\n\n", size(eld_data));
    
        %{
        Classifies new dataset from using the current clusters.
        Searches for nearest centroid from every data point using "pdist2".
        "pdist2 is needed to assign new datasets to these clusters.
        %}
    
        [~,class_new] = pdist2(C,eld_data,'euclidean','Smallest',1);
            
        gscatter(eld_data(:,1),eld_data(:,2),class_new,'rbm','ooo')
        legend('Sierra','Hotel', 'India', 'X Centorids','Echo','Lima','Delta')
        %S & E: red, H & L: blue, I & D: magenta
    %=========================================================================
    end
end