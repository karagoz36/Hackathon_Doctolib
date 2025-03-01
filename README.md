# Hackathon Doctolib - Team Medicall

Welcome to **Medicall**, the project developed during the **Doctolib AI Action Summit Hackathon**! Our solution leverages **AI-powered vision and voice feedback** to improve **sports coaching and rehabilitation**, ensuring better execution and reducing injury risks.

## 🏆 Achievement
🥉 **3rd Place - Doctolib AI Action Summit Hackathon** (February 2025)

## 👥 Team Members
- **Sai Dunoyer**
- **Simon Kasperski**
- **Taha Karagoz**
- **Lucas Pascal**
- **Yoan Sapienza**
- **Camille Truchot**

## 🎯 Problem Statement
Many people perform sports or rehabilitation exercises incorrectly, leading to **increased injury risks and slower progress**. The key issues include:
- **Limited availability of physiotherapists**
- **Lack of real-time feedback when training alone**

## 💡 Our Solution
**Medicall** enhances the rehabilitation and training experience by providing:
- **Real-Time Posture Analysis** 📷 – AI-powered vision models detect and analyze body posture during exercises.
- **Instant Voice Feedback** 🔊 – Immediate verbal corrections ensure users perform movements correctly.

## 🚀 Key Benefits
✅ **Improved Execution** – Real-time corrections ensure proper movement.
✅ **Injury Prevention** – Reduces risks associated with incorrect posture.
✅ **Accessibility** – Works anytime, anywhere.
✅ **Motivation Boost** – Immediate feedback enhances engagement and consistency.

## 🎯 Target Audience
- **Patients** undergoing rehabilitation with limited supervision.
- **Coaches and physiotherapists** looking for an AI-assisted training tool.

## 🛠️ Technical Stack
- **Computer Vision:** MediaPipe (for real-time posture analysis and error detection)
- **Cloud-Based Platform**
- **Backend:** FastAPI
- **Database:** PostgreSQL
- **Frontend:** React

## ⚙️ Prerequisites
Before getting started, ensure you have the following installed:
- [Make](https://www.gnu.org/software/make/)
- Python 3.8+

## 🔧 Installation and Execution
To build and run the project, use the following commands:

```sh
make
make backend-local
```

### 🔑 LLM Configuration
The project uses an AI model based on **Large Language Models (LLMs)**. To properly run the backend, you need to provide an **OpenAI API key** in a `.env` file located in the root of the `backend` folder.

#### Example `.env` file:
```
OPENAI_API_KEY=your_openai_api_key_here
```

## 📂 Project Structure
- `backend/` : Contains the backend code of the project.
- `frontend/` : Contains the frontend code (if applicable).
- `Makefile` : Contains commands to build and run the project.

---
This project was developed in collaboration with **Doctolib, SIA, Scaleway, RAISE Summit, NVIDIA, SWEEP, Mistral AI, Back Market, and Sfil** as part of the **AI Action Summit Hackathon**.

🔗 *Stay tuned for future improvements and potential real-world applications!* 🚀
