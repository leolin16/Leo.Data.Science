# LUIS - Language Understanding Intelligent Service

## Intents - verb + Noun

### pre-built domains

1. Calendar
2. Coomunication
3. Email
4. HomeAutomation
5. Notes
6. Places
7. Restaurant Reservation
8. ToDo
9. Utilities
10. Weather
11. Web

### Intent Details

[intents list](https://docs.microsoft.com/en-us/azure/cognitive-services/luis/luis-prebuilt-domains)

1. None - Default intent
2. Domain Intents (eg: Calendar.CheckAvailability/Cancel/Confirm/FindDuration)

## Entities - Condition/Where/When/Why

### entity types

1. Simple - Book a flight to Dubai => Dubai is an entity, book a flight is the intent
2. List - Synonyms like Amsterdam = AMS = Schiphol
3. Regex - I want to book flight VY1233 => (VY[0-9]{4})
4. Composite - Book a flight from Dubai to Doha => Dubai Doha are the combined entity
5. Pattern.Any - Can I book a flight on a Beluga => Beluga is {TypeOfPlane}[?]
6. Prebuilt - Number, Ordinal, Temperature, Dimension, Money, Age, Percentage, Email, Url, Phone Number, Date Time
7. Phrases/Phrase lists - Machine Learned domain specific like 737,747,A350,A380... or product name/project name/enployee title/names of procedures => used for grouping synonyms and non-synonyms (terms that LUIS might have difficulty recognizing)

## Utterances - phrases that bind entities to intents

## steps

1. <https://portal.azure.com> to create "Language Understanding" service with F0 pricing tier
2. <https://luis.ai/home> - My Apps -> create new app
3. in the app screen, manage -> Keys and Endpoints - Assign resource (we've created in portal to this app)
4. App -> Build -> Entities -> Add Prebuilt entity
5. App -> Build -> Entities -> Create new entity ex: musicservice
6. App -> Build -> Intents -> Create new intent ex: musicservice