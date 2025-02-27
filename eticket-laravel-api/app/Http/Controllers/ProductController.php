<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::all();
        return response()->json($products);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreProductRequest $request)
    {
        $request->validated([
            'name' => 'required',
            'price' => 'required',
            'stock' => 'required',
        ]);

        // $product = Product::create($request->all());

        $product = new Product();
        $product->name = $request->name;
        $product->description = $request->description;
        $product->stock = $request->stock;
        $product->price = $request->price;
        $product->favorite = false;
        $product->status = 'published';
        $product->save();

        if ($request->file('image')) {
            $image = $request->file('image');
            $image->storeAs('public/products', $product->id . '.png');
            $product->image = $product->id . '.png';
            $product->save();
        }

        return response()->json([
            'status' => true,
            'message' => 'create product successfully'
        ], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $product = Product::find($id);
        if(!$product) {
            return response()->json([
                'message' => 'product not found',
                'status' => 'error',
            ]);
        }
        return response()->json($product);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateProductRequest $request, $id)
    {
        $product = Product::find($id);

        $product->name = $request->name;
        $product->price = $request->price;
        $product->description = $request->description;
        $product->stock = $request->stock;
        $product->favorite = $request->favorite;
        $product->status = $request->status;
        $product->save();

        if ($request->file('image')) {
            $image = $request->file('image');
            $image->storeAs('public/products', $product->id . '.png');
            $product->image = $product->id . '.png';
            $product->save();
        }

        return response()->json([
            'status' => true,
            'message' => 'update product successfully'
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $product = Product::find($id);

        $product->delete();

        return response()->json([
            'status' => true,
            'message' => 'delete product successfully'
        ], 200);
    }
}
