require_relative 'test_helper'
class AriadneTest < MiniTest::Test
  def test_insert_data
    app_name = 'test'
    data = {
      'id'    => 123,
      'state' => 'active'
    }

    out = Ariadne.insert_data(options: data, app_name: app_name)
    assert_equal Redis::Future, out.class
  end

  def test_get_data
    app_name = 'test'
    data = {
      'id'    => 123,
      'state' => 'active'
    }
    Ariadne.insert_data(options: data, app_name: app_name)
    out = Ariadne.get_data(app_name: app_name)
    assert_equal JSON.parse(out[0])['id'], data['id']
  end

  def test_get_data_with_time_diff_without_delay_should_be_empty
    app_name = 'test'
    data = {
      'id'    => 123,
      'state' => 'active'
    }

    Ariadne.insert_data(options: data, app_name: app_name)
    out = Ariadne.get_data_with_time_difference(app_name: app_name)
    assert_empty JSON.parse(out)
  end

  def test_get_data_with_time_diff_with_delay_should_not_be_empty
    app_name = 'test'
    delay_interval = 2
    data = {
      'id'             => 123,
      'state'          => 'active',
      'delay_interval' => delay_interval
    }

    Ariadne.insert_data(options: data, app_name: app_name)
    sleep delay_interval
    out = Ariadne.get_data_with_time_difference(app_name: app_name)
    assert_equal JSON.parse(out)[0]['id'], data['id']
  end

  def test_get_data_with_id
    app_name = 'test'
    data = {
      'id'    => 123,
      'state' => 'active'
    }

    Ariadne.insert_data(options: data, app_name: app_name)
    out = Ariadne.get_data(id: data['id'], app_name: app_name)
    assert_equal JSON.parse(out[0])['id'], data['id']
  end

  def test_get_data_with_time_diff_with_id_without_delay_should_be_empty
    app_name = 'test'
    data = {
      'id'    => 123,
      'state' => 'active'
    }

    Ariadne.insert_data(options: data, app_name: app_name)
    out = Ariadne.get_data_with_time_difference(id: data['id'], app_name: app_name)
    assert_empty JSON.parse(out)
  end

  def test_get_data_with_time_diff_with_id_with_delay_should_not_be_empty
    app_name = 'test'
    delay_interval = 2
    data = {
      'id'             => 123,
      'state'          => 'active',
      'delay_interval' => delay_interval
    }

    Ariadne.insert_data(options: data, app_name: app_name)
    sleep delay_interval
    out = Ariadne.get_data_with_time_difference(id: data['id'], app_name: app_name)
    assert_equal JSON.parse(out)[0]['id'], data['id']
  end
end