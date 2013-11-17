undef("create_areawgt_latlon_Wrap")
function create_areawgt_latlon_Wrap(lat:numeric,lon:numeric)
begin
    print("--------------------------------------------------")
    print("Welcome to hwy_ncl_package")
    print("You are creating the area weights ...")
    dlon =   abs(lon(1) - lon(0))
    dlat =   abs(lat(1) - lat(0))
    num_lon =   dimsizes(lon)
    num_lat =   dimsizes(lat)
    area_wgt    =   new((/num_lat,num_lon/),float)
    dx  =   new(num_lat,float)
    dy  =   new(num_lat,float)
    re  =   6.371e6
    rad =   4.0*atan(1.0)/180.0
    do j = 1-1, num_lat-1
        dx(j)   =   doubletofloat(re*cos(lat(j)*rad)*dlon*rad)
        dy(j)   =   doubletofloat(re*abs(dlat)*rad)
    end do
    do j = 1-1, num_lat-1
    do i = 1-1, num_lon-1
        area_wgt(j,i)   =   dx(j)*dy(j)
    end do
    end do
    area_wgt!0  =   "lat"
    area_wgt!1  =   "lon"
    area_wgt&lat    =   lat
    area_wgt&lon    =   lon
    print("Minimum of the area weights: "+min(area_wgt))
    print("Total area: "+sum(area_wgt))
    if (min(area_wgt) .lt. 0.0 .or. abs(sum(area_wgt) -5.1e14) .gt. 0.01*5.1e14) then
        print("error in the area weights")
        return(area_wgt)
    end if
    print("Create the area weights successfully!")
    print("--------------------------------------------------")
    return(area_wgt)
end

undef("create_areawgt_var_Wrap")
function create_areawgt_var_Wrap(var:numeric)
begin
    print("--------------------------------------------------")
    print("Welcome to hwy_ncl_package")
    print("You are creating the area weights ...")
    lon  =   var&lon
    lat  =   var&lat
    dlon =   abs(lon(1) - lon(0))
    dlat =   abs(lat(1) - lat(0))
    num_lon =   dimsizes(lon)
    num_lat =   dimsizes(lat)
    area_wgt    =   new((/num_lat,num_lon/),float)
    dx  =   new(num_lat,float)
    dy  =   new(num_lat,float)
    re  =   6.371e6
    rad =   4.0*atan(1.0)/180.0
    do j = 1-1, num_lat-1
        dx(j)   =   doubletofloat(re*cos(lat(j)*rad)*dlon*rad)
        dy(j)   =   doubletofloat(re*abs(dlat)*rad)
    end do
    do j = 1-1, num_lat-1
    do i = 1-1, num_lon-1
        area_wgt(j,i)   =   dx(j)*dy(j)
    end do
    end do
    area_wgt!0  =   "lat"
    area_wgt!1  =   "lon"
    area_wgt&lat    =   lat
    area_wgt&lon    =   lon
    print("Minimum of the area weights: "+min(area_wgt))
    print("Total area: "+sum(area_wgt))
    if (min(area_wgt) .lt. 0.0 .or. abs(sum(area_wgt) -5.1e14) .gt. 0.01*5.1e14) then
        print("error in the area weights")
        return(area_wgt)
    end if
    print("Create the area weights successfully!")
    print("--------------------------------------------------")
    return(area_wgt)
end

undef("create_areawgt_latlon_bnds_Wrap")
function create_areawgt_latlon_bnds_Wrap(lat:numeric,lon:numeric,lat_bnds:numeric,lon_bnds:numeric)
begin
    print("--------------------------------------------------")
    print("Welcome to hwy_ncl_package")
    print("You are creating the area weights ...")
    num_lon =   dimsizes(lon)
    num_lat =   dimsizes(lat)
    
    dlat    =   lat
    do j = 0, num_lat-1
        dlat(j) =   abs(lat_bnds(j,0)-lat_bnds(j,1))
    end do
    dlon    =   abs(lon_bnds(0,0)-lon_bnds(0,1))

    area_wgt    =   new((/num_lat,num_lon/),float)
    dx  =   new(num_lat,float)
    dy  =   new(num_lat,float)
    re  =   6.371e6
    rad =   4.0*atan(1.0)/180.0
    do j = 1-1, num_lat-1
        dx(j)   =   doubletofloat(re*cos(lat(j)*rad)*dlon*rad)
        dy(j)   =   doubletofloat(re*abs(dlat(j))*rad)
    end do
    do j = 1-1, num_lat-1
    do i = 1-1, num_lon-1
        area_wgt(j,i)   =   dx(j)*dy(j)
    end do
    end do
    area_wgt!0  =   "lat"
    area_wgt!1  =   "lon"
    area_wgt&lat    =   lat
    area_wgt&lon    =   lon
    print("Minimum of the area weights: "+min(area_wgt))
    print("Total area: "+sum(area_wgt))
    if (min(area_wgt) .lt. 0.0 .or. abs(sum(area_wgt) -5.1e14) .gt. 0.01*5.1e14) then
        print("error in the area weights")
        return(area_wgt)
    end if
    print("Create the area weights successfully!")
    print("--------------------------------------------------")
    return(area_wgt)
end

undef("create_areawgt_latlon_center_Wrap")
function create_areawgt_latlon_center_Wrap(lat:numeric,lon:numeric)
begin
    print("--------------------------------------------------")
    print("Welcome to hwy_ncl_package")
    print("You are creating the area weights ...")
    dlon =   abs(lon(1) - lon(0))
    num_lon =   dimsizes(lon)
    num_lat =   dimsizes(lat)
    area_wgt    =   new((/num_lat,num_lon/),float)

    dlat    =   lat
    dlat(0) =   abs(lat(0)-lat(1))
    bnds_point = (lat(0)+lat(1))/2.0
    do j = 1, num_lat-1
        bnds_point_new =  2.0*lat(j) - bnds_point 
        dlat(j) =  abs(bnds_point_new-bnds_point) 
        bnds_point = bnds_point_new
    end do

    dx  =   new(num_lat,float)
    dy  =   new(num_lat,float)
    re  =   6.371e6
    rad =   4.0*atan(1.0)/180.0
    do j = 1-1, num_lat-1
        dx(j)   =   doubletofloat(re*cos(lat(j)*rad)*dlon*rad)
        dy(j)   =   doubletofloat(re*abs(dlat(j))*rad)
    end do
    do j = 1-1, num_lat-1
    do i = 1-1, num_lon-1
        area_wgt(j,i)   =   dx(j)*dy(j)
    end do
    end do
    area_wgt!0  =   "lat"
    area_wgt!1  =   "lon"
    area_wgt&lat    =   lat
    area_wgt&lon    =   lon
    print("Minimum of the area weights: "+min(area_wgt))
    print("Total area: "+sum(area_wgt))
    if (min(area_wgt) .lt. 0.0 .or. abs(sum(area_wgt) -5.1e14) .gt. 0.01*5.1e14) then
        print("error in the area weights")
        return(area_wgt)
    end if
    print("Create the area weights successfully!")
    print("--------------------------------------------------")
    return(area_wgt)
end

undef("create_areawgt_var_center_Wrap")
function create_areawgt_var_center_Wrap(var:numeric)
begin
    print("--------------------------------------------------")
    print("Welcome to hwy_ncl_package")
    print("You are creating the area weights ...")
    lat  =   var&lat
    lon  =   var&lon
    dlon =   abs(lon(1) - lon(0))
    num_lon =   dimsizes(lon)
    num_lat =   dimsizes(lat)
    area_wgt    =   new((/num_lat,num_lon/),float)

    dlat    =   lat
    dlat(0) =   abs(lat(0)-lat(1))
    bnds_point = (lat(0)+lat(1))/2.0
    do j = 1, num_lat-1
        bnds_point_new =  2.0*lat(j) - bnds_point 
        dlat(j) =  abs(bnds_point_new-bnds_point) 
        bnds_point = bnds_point_new
    end do

    dx  =   new(num_lat,float)
    dy  =   new(num_lat,float)
    re  =   6.371e6
    rad =   4.0*atan(1.0)/180.0
    do j = 1-1, num_lat-1
        dx(j)   =   doubletofloat(re*cos(lat(j)*rad)*dlon*rad)
        dy(j)   =   doubletofloat(re*abs(dlat(j))*rad)
    end do
    do j = 1-1, num_lat-1
    do i = 1-1, num_lon-1
        area_wgt(j,i)   =   dx(j)*dy(j)
    end do
    end do
    area_wgt!0  =   "lat"
    area_wgt!1  =   "lon"
    area_wgt&lat    =   lat
    area_wgt&lon    =   lon
    print("Minimum of the area weights: "+min(area_wgt))
    print("Total area: "+sum(area_wgt))
    if (min(area_wgt) .lt. 0.0 .or. abs(sum(area_wgt) -5.1e14) .gt. 0.01*5.1e14) then
        print("error in the area weights")
        return(area_wgt)
    end if
    print("Create the area weights successfully!")
    print("--------------------------------------------------")
    return(area_wgt)
end
