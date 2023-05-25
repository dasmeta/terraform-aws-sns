exports.handler = async(event, context) => {

  console.log({event: JSON.stringify(event), context})

  const response = {
      statusCode: 200,
      body: JSON.stringify('Hello from Lambda!'),
  };

  return response;
};
