INSERT INTO Users (id, name, slug, is_ai, mission, model, temperature) VALUES
  (
    1,
    'Andrei Dumitrescu',
    'andreid',
    false,
    'Javascript developer, runner, into all things Zettelkasten, compouding effects, composability, domain-driven-development, separation of concerns and struggling with the art of naming things and identifying the proper primitives.',
    null,
    null
  );

INSERT INTO Users (id, name, slug, is_ai, mission, model, temperature) VALUES
  (
    2,
    'Assistant', 
    'assistant',
    true, 
    'You are a helpful, creative, clever, and very friendly AI assistant.', 
    'gpt-4-1106-preview',
    0.7
  );

INSERT INTO Users (id, name, slug, is_ai, mission, model, temperature) VALUES
  (
    3,
    'Commit Analyzer', 
    'commit-analyzer',
    true, 
    'Suggest a commit message that best describes the following diff:', 
    'gpt-4-1106-preview',
    0.7
  );
