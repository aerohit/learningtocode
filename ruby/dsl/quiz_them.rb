#!/usr/bin/env ruby

# Learned from http://jroller.com/rolsen/entry/building_a_dsl_in_ruby
require 'singleton'
class Quiz
  include Singleton

  def initialize
    @questions = []
  end

  def add_question(question)
    @questions << question
  end

  def last_question
    @questions.last
  end

  def run_quiz
    correct_answers = 0
    @questions.each { |q| correct_answers += 1 if q.ask }
    puts "You got #{correct_answers} answers correct out of #{@questions.size}."
  end
end

class Question
  def initialize(text)
    @text    = text
    @answers = []
  end

  def add_answer(answer)
    @answers << answer
  end

  def ask
    puts ""
    puts "Question: #{@text}"
    @answers.size.times do |i|
      puts "#{i+1} - #{@answers[i].text}"
    end
    print "Enter answer: "
    answer = gets.to_i - 1
    @answers[answer].correct
  end
end

class Answer
  attr_reader :text, :correct
  def initialize(text, correct)
    @text    = text
    @correct = correct
  end
end

def question(text)
  Quiz.instance.add_question Question.new(text)
end

def right(text)
  Quiz.instance.last_question.add_answer Answer.new(text, true)
end

def wrong(text)
  Quiz.instance.last_question.add_answer Answer.new(text, false)
end

load 'questions.qm'

Quiz.instance.run_quiz
