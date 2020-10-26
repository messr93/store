<?php

namespace App\Http\Controllers\BackendControllers;

use App\Http\Controllers\Controller;
use App\Slider;
use App\Traits\HandleImages;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class SliderController extends Controller
{

    use HandleImages;

    public function __construct()
    {
        changeLang('ar');
    }



    public function index()
    {

        return view('backend.slider.index', ['pageTitle' => __('backend.All sliders')]);
    }

    public function allData(){

        $sliders = Slider::all();
        return DataTables::of($sliders)
            ->addColumn('actions', 'backend.slider.actions')
            ->editColumn('photo', '<img src="{{ url(\'uploads/slider/110x110\')}}/{{$photo}}" style="height: 75px; width: 75px" class="mx-auto d-block">')
            ->editColumn('status', function(Slider $slider){
                return ($slider->status == 1)? '<span class="text-success">'.__('backend.Active').'</span>': '<span class="text-danger">'.__('backend.unActive').'</span>';
            })
            ->rawColumns(['photo', 'actions', 'status'])
            ->make(true);
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        return view('backend.slider.create', ['pageTitle' => __('backend.Add slider')]);
    }


    public function store(Request $request)
    {
        $data = $request->validate([
           'title' => 'required|string',
           'description' => 'required|string',
           'status' => 'required|integer|min:0|max:1',
           'link' => 'required|url',
           'photo' => 'required|image|dimensions:min_width=1200,min_height=700',
        ]);

        if($request->hasFile('photo')){
            $photo = $request->file('photo');
            $photoName = 'slider_'.time().'.'.$photo->getClientOriginalExtension();
            $this->uploadSliderImage($photo, $photoName);
            $data['photo'] = $photoName;
        }

        Slider::create($data);
        return redirect()->route('admin.slider.index')->with('success', __('backend.Slider created'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /////////////////////////////////////////////////
    public function changeStatus(Request $request){

        $slider = Slider::find($request->input('id'));
        if(is_null($slider))
            return response()->json(['message' => __('backend.Slider not exists')], 404);

        $slider->status = ($slider->status == 1)? 0: 1;
        $slider->save();
        return response()->json(['data' => $slider], 200);
    }

    public function delete(Request $request){

        $slider = Slider::find($request->input('id'));
        if(is_null($slider))
            return response()->json(['message' => __('backend.Slider not exists')], 404);

        $this->deleteSliderImages($slider);
        $slider->delete();
        return response()->json(['data' => $slider], 200);
    }
}
