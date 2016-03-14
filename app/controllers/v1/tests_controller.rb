class V1::TestsController < ApplicationController

  def step
    step = get_step_param
    if step
      render json: {
        question: TestProcessador.questions[step],
        result: current_user.test_result.send(step)
      }
    else
      render json: { message: "invalid params" }, status: :unprocessable_entity
    end
  end

  def update
    if current_user.test_result.update(results_params)
      render json: current_user.test_result, status: :ok
    else
      render json: current_user.test_result.errors, status: :unprocessable_entity
    end
  end

  def results
    if current_user.test_result.complete
      render json: current_user.get_test_results, status: :ok
    else
      render json: { message: "No results yet." }, status: :unprocessable_entity
    end
  end

  private

  def results_params
    params.permit(:extraversion, :feeling, :introversion, :judging, :intuition,
      :perceiving, :sensing, :thinking, :complete, :step)
  end

  def get_step_param
    if params[:step] && TestProcessador::DIMENSIONS_LETTER.keys.include?(params[:step])
      params[:step]
    end
  end
end