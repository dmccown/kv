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
end
