//
//  ViewController.swift
//  ScaledroneChatTest
//
//  Created by Marin Benčević on 08/09/2018.
//  Copyright © 2018 Scaledrone. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView




class ChatController: MessagesViewController {
    
    @IBAction func ChatAction(_ sender: Any) {
        performSegue(withIdentifier: "showNext", sender: nil)
    }
    
    var chatService: ChatService!
    var messages: [Message] = []
    var member: Member!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        member = Member(name: .randomName, color: .random)
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        chatService = ChatService(member: member, onRecievedMessage: {
            [weak self] message in
            self?.messages.append(message)
            self?.messagesCollectionView.reloadData()
            self?.messagesCollectionView.scrollToBottom(animated: true)
        })
        
        chatService.connect()
    }
}

extension ChatController: MessagesDataSource {
    func currentSender() -> SenderType {
        return Sender(id: member.name, displayName: member.name)
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> MessageType {
        
        return messages[indexPath.section]
    }
    
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 12
    }
    
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        return NSAttributedString(
            string: message.sender.displayName,
            attributes: [.font: UIFont.systemFont(ofSize: 12)])
    }
}

extension ChatController: MessagesLayoutDelegate {
    func heightForLocation(message: MessageType,
                           at indexPath: IndexPath,
                           with maxWidth: CGFloat,
                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
}

extension ChatController: MessagesDisplayDelegate {
    func configureAvatarView(
        _ avatarView: AvatarView,
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) {
        
        let message = messages[indexPath.section]
        let color = message.member.color
        avatarView.backgroundColor = color
    }
}

extension ChatController: MessageInputBarDelegate {
    
    internal func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        chatService.sendMessage(text)
        switch text.lowercased() {
        case "ola":
            chatService.sendMessage("Veggie responde: Olá, eu sou sua assistente do Can I Eat? Meu nome é Veggie, qual o seu nome?")
        case "gabriel":
            chatService.sendMessage("Veggie responde: O aplicativo foi desenvolvido para auxiliar você a escolher o melhor produto de acordo com suas restrições alimentares ou dietas recomendadas. Me conte, Gabriel, qual sua finalidade com o app? Restricao alimentar ou voce esta seguindo alguma dieta?")
        case "restricao alimentar":
            chatService.sendMessage("Veggie responde: Entendi. Me informe os alimentos ou produtos que você não pode consumir (ex: lactose, cafeína, glúten etc)")
        case "lactose":
            chatService.sendMessage("Veggie responde: Ok, Gabriel. Alguma restrição a mais?")
        case "nao":
            chatService.sendMessage("Veggie responde: Pronto. Você já pode utilizar o app para pesquisas dentro da nossa biblioteca por alimentos compatíveis com as suas restrições. Caso nāo encontre o que deseja, nosso aplicativo possibilita você escanear o código de barras de um produto ou QR Code para saber se os ingredientes sāo adequados para suas necessidades.")
        case "dieta":
            chatService.sendMessage("Veggie responde: Qual tipo de dieta voce pretende seguir?")
        case "vegana":
            chatService.sendMessage("Veggie responde: Entendido, me informe suas preferências alimentares para eu indicar alimentos saudáveis de acordo com o seu gosto. (ex: verduras, frutas, grãos etc)")
        case "verdura":
            chatService.sendMessage("Veggie responde: E tem alguma coisa que você não gosta?")
        case "pvt":
            chatService.sendMessage("Veggie responde: Ok, nao te recomendarei pvt, entao!")
            chatService.sendMessage("Veggie responde: Ok, Gabriel. Alguma outra informacao?")
        default:
            chatService.sendMessage("Veggie responde: Não entendi sua resposta. Você pode escrever novamente?")
            
        }
            
        inputBar.inputTextView.text = ""
    }
}

