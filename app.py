from flask import Flask, render_template, url_for

app = Flask(__name__)

# --- INFORMAÇÕES PESSOAIS ATUALIZADAS ---
dados_pessoais = {
    "nome": "João Lopes",
    "titulo": "Desenvolvedor Web",
    "sobre_mim": "Sou estudante de Análise e Desenvolvimento de Sistemas, com foco em desenvolvimento web. Estudo Python com Flask, além de HTML, CSS e C, buscando sempre aprimorar minha lógica e habilidades técnicas. Procuro oportunidades para aplicar meus conhecimentos na prática e crescer como desenvolvedor de forma responsável e comprometida.",
    
    # LISTA DE HABILIDADES IMPLEMENTADA COM LOGOS
    "habilidades": [
        {
            "nome": "Python",
            "logo": "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original.svg"
        },
        {
            "nome": "Flask",
            "logo": "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flask/flask-original.svg"
        },
        {
            "nome": "HTML5",
            "logo": "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg"
        },
        {
            "nome": "CSS3",
            "logo": "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg"
        },
        {
            "nome": "PostgreSQL",
            "logo": "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-original.svg"
        },
        {
            "nome": "C",
            "logo": "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/c/c-original.svg"
        },
    ],

    "contato": {
        "email": "contato.joaolps@gmail.com",
        "telefone": "+55 (92) 99239-5319"
    },
    "redes_sociais": {
        "linkedin": "https://www.linkedin.com/in/joao-lopes-almeida?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
        "github": "https://github.com/Jotalllopss",
        "instagram": "https://www.instagram.com/joao.lpps/"
    }
}
# ---------------------------------------------

@app.route('/')
def home():
    """
    Renderiza a página do portfólio passando os dados pessoais.
    """
    return render_template('portfolio.html', dados=dados_pessoais)

if __name__ == '__main__':
    app.run(debug=True)
