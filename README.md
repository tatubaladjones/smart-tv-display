# Smart TV Display

Um aplicativo Flutter robusto e elegante para exibição de conteúdo em Smart TVs (FireStick) com painel administrativo completo.

## 🎯 Características

### 📺 Painel de TV (FireStick)
- Exibição elegante de vídeos e imagens em fullscreen
- Carrossel automático de mídia com transições suaves
- Relógio digital em tempo real com data e horário
- Integração com previsão do tempo (OpenWeatherMap)
- Rodapé de notícias em tempo real (NewsAPI)
- Sincronização automática com servidor
- Cache inteligente de mídia

### 🎛️ Painel Administrativo (PC/Web/Windows)
- Upload de vídeos e imagens
- Gerenciamento completo de mídia (ativar/desativar/deletar)
- Agendamento de encerramento de mídia
- Configurações do aplicativo
- Usuários e permissões
- Sincronização em tempo real via WebSocket
- Busca e filtros avançados

### 🔐 Segurança
- Detecção automática de dispositivo
- Acesso administrativo **APENAS** em Web/Windows
- Bloqueio total em FireStick/Mobile
- Autenticação JWT
- Criptografia de senhas

## 📁 Estrutura do Projeto

```
lib/
├── config/
│   ├── routes/
│   ├── theme/
│   └── constants/
├── core/
│   ├── error/
│   ├── network/
│   ├── storage/
│   ├── device/
│   └── utils/
├── data/
│   ├── datasources/
│   │   ├── local/
│   │   └── remote/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   ├── cubits/
│   └── controllers/
└── main.dart
```

## 🚀 Getting Started

### Pré-requisitos
- Flutter >= 3.13.0
- Dart >= 3.0.0
- Android SDK 21+

### Instalação

1. Clone o repositório
```bash
git clone https://github.com/tatubaladjones/smart-tv-display.git
cd smart-tv-display
```

2. Instale dependências
```bash
flutter pub get
```

3. Gere arquivos (models, hive, retrofit)
```bash
flutter pub run build_runner build
```

4. Execute o aplicativo
```bash
flutter run
```

## 🔧 Configuração

### Variáveis de Ambiente
Crie um arquivo `.env` na raiz do projeto:

```env
API_BASE_URL=http://seu-servidor.com/api
WEATHER_API_KEY=sua_chave_openweathermap
NEWS_API_KEY=sua_chave_newsapi
WEBSOCKET_URL=ws://seu-servidor.com/socket
```

### APIs Necessárias
1. **OpenWeatherMap** - Previsão do tempo
2. **NewsAPI** - Rodapé de notícias
3. **Seu Backend** - Upload e sincronização de mídia

## 📱 Uso

### Na TV (FireStick)
1. Instale o APK
2. O app iniciará automaticamente em modo de exibição
3. Para acessar configurações (se em Windows/Web): use atalho especial

### No PC (Admin)
1. Acesse via web ou app Windows
2. Faça login com suas credenciais
3. Upload de mídia, configurações, agendamentos
4. Mudanças são sincronizadas em tempo real para todas as TVs

## 🌐 Backend (Node.js + Express)

Veja a documentação em `/backend/README.md`

## 🧪 Testes

```bash
flutter test
```

## 📦 Build & Deploy

### APK para FireStick
```bash
flutter build apk --release
```

### App Android completo
```bash
flutter build appbundle --release
```

## 🛠️ Desenvolvimento

### Branches
- `main` - Produção
- `develop` - Desenvolvimento
- `feature/*` - Novas funcionalidades
- `bugfix/*` - Correções

### Convenção de Commits
```
feat: nova funcionalidade
fix: correção de bug
docs: documentação
style: formatação
refactor: refatoração
test: testes
chore: atualizações de dependências
```

## 📄 Licença

MIT License - veja LICENSE.md

## 👤 Autor

**Tatuba Ladeira Jones**
- GitHub: [@tatubaladjones](https://github.com/tatubaladjones)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

## 📞 Suporte

Para suporte, abra uma issue no GitHub.
