# CampusCoin (CAMP) 🪙

Token digital do padrão **ERC-20** desenvolvido para a disciplina de **Blockchain, Smart Contracts e Web3**. A CampusCoin é uma moeda interna pensada para um ecossistema universitário, com usos como eventos, serviços da biblioteca e premiação de alunos. O contrato foi construído sobre a biblioteca **OpenZeppelin** e publicado de forma real na rede de testes **Ethereum Sepolia**.

---

## 📋 Dados do contrato

| Item | Informação |
|---|---|
| Nome | CampusCoin |
| Símbolo | CAMP |
| Casas decimais | 18 |
| Supply inicial | 1.000.000 CAMP |
| Rede | Ethereum Sepolia (Chain ID 11155111) |
| Endereço | `0x4D8feea345cc1482456008B26453282D6cb0E17a` |
| Verificação | Sourcify + Blockscout |
| Ferramentas | Remix IDE, MetaMask, ethers.js |

🔗 **Etherscan:** https://sepolia.etherscan.io/address/0x4D8feea345cc1482456008B26453282D6cb0E17a
🔗 **Blockscout:** https://eth-sepolia.blockscout.com/address/0x4D8feea345cc1482456008B26453282D6cb0E17a

---

## ⚙️ Funcionalidades

- **ERC-20 padrão** — transferência, consulta de saldo (`balanceOf`) e supply total (`totalSupply`).
- **Mint** — emissão de novos tokens, restrita ao dono (`onlyOwner`).
- **Burn** — queima de tokens do próprio saldo.
- **Blacklist** — bloqueio de endereços de enviar/receber tokens (`mapping` + `require`).
- **Controle de acesso** — funções administrativas protegidas pelo padrão `Ownable`.

> Foram implementadas 3 funcionalidades extras (Mint, Burn e Blacklist), além do mínimo exigido.

---

## 📁 Estrutura do projeto

```
projeto-token/
├── contracts/
│   └── CampusCoin.sol     # contrato inteligente
├── frontend/
│   └── index.html         # interface Web3 (ethers.js)
├── README.md
└── relatorio.pdf          # relatório técnico
```

---

## 🚀 Como usar

### Compilar e publicar (Remix)

1. Abra o [Remix IDE](https://remix.ethereum.org) e crie o arquivo `CampusCoin.sol`.
2. Compile com o compilador Solidity `0.8.20` ou superior.
3. Em **Deploy & Run**, selecione o ambiente **Injected Provider - MetaMask** com a carteira na rede **Sepolia**.
4. Informe o `supplyInicial` (ex.: `1000000`) e clique em **Deploy**.

> É necessário ter SepoliaETH na carteira (obtido em um faucet de testnet) para pagar o gas.

### Rodar o frontend

1. Abra o arquivo `frontend/index.html` no navegador (com a extensão MetaMask instalada).
2. Confirme que a MetaMask está na rede **Sepolia**.
3. Clique em **Conectar MetaMask** para ver o saldo e transferir tokens.

> O endereço do contrato já está configurado no `index.html`. Para usar outro contrato, altere a constante `CONTRATO`.

---

## ✅ Testes realizados

| Teste | Resultado |
|---|---|
| Compilação no Remix | ✔️ Sucesso |
| Deploy na Sepolia | ✔️ Sucesso |
| `balanceOf` / `transfer` | ✔️ Sucesso |
| Mint / Burn | ✔️ Sucesso |
| Transferência para endereço na blacklist | ✔️ Revertida (esperado) |
| Mint por conta não-dona | ✔️ Revertida (esperado) |
| Verificação pública | ✔️ Sucesso |

---

## 💰 Custos (testnet)

O deploy consumiu cerca de **1.279.400 de gas** (~0,0042 SepoliaETH). As operações de transferência, mint e burn têm custo bem menor, por não publicarem novo bytecode.

---

## 🎥 Demonstração

- **Vídeo:** https://youtu.be/FOFYRYMh1Qw
