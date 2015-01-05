defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "is empty by default", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil
  end

  test "stores a value by key", %{bucket: bucket} do
    KV.Bucket.put(bucket, "milk", 3)
    
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "delete a value by key and return the value", %{bucket: bucket} do
    KV.Bucket.put(bucket, "milk", 100)

    value = KV.Bucket.delete(bucket, "milk")

    assert value == 100
    assert KV.Bucket.get(bucket, "milk") == nil
  end
end
