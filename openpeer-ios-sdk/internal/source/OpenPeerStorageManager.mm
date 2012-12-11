/*
 
 Copyright (c) 2012, SMB Phone Inc.
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 The views and conclusions contained in the software and documentation are those
 of the authors and should not be interpreted as representing official policies,
 either expressed or implied, of the FreeBSD Project.
 
 */


#import "OpenPeerStorageManager.h"
//#import "HOPCall.h"
//#import "HOPContact.h"
//#import "HOPConversationThread.h"

@interface OpenPeerStorageManager()

- (void) initSingleton;
@end

@implementation OpenPeerStorageManager

+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
        if (_sharedObject)
            [_sharedObject initSingleton];
    });
    return _sharedObject;
}

- (void) initSingleton
{
    _dictionaryCalls = [[NSMutableDictionary alloc] retain];
}


- (void)dealloc
{
    [_dictionaryCalls release];
    [super dealloc];
}


- (HOPCall*) getCallForId:(NSString*) callId
{
    HOPCall* call = nil;
    
    call = [_dictionaryCalls objectForKey:callId];
    
    return call;
}

- (void) setCall:(HOPCall*) call forId:(NSString*) callId
{
    [_dictionaryCalls setObject:call forKey:callId];
}

- (HOPConversationThread*) getConversationThreadForId:(NSString*) threadId
{
    HOPConversationThread* conversationThread = nil;
    
    conversationThread = [_dictionaryConversationThreads objectForKey:threadId];
    
    return conversationThread;
}

- (void) setConversationThread:(HOPConversationThread*) conversationThread forId:(NSString*) threadId
{
    [_dictionaryConversationThreads setObject:conversationThread forKey:threadId];
}

- (HOPContact*) getContactForId:(NSString*) contactId
{
    HOPContact* contact = nil;
    
    contact = [_dictionaryContacts objectForKey:contactId];
    
    return contact;
}
- (void) setContact:(HOPContact*) contact forId:(NSString*) contactId
{
    [_dictionaryContacts setObject:contact forKey:contactId];
}

- (HOPProvisioningAccount*) getProvisioningAccountForUserId:(NSString*) userId
{
    HOPProvisioningAccount* provisioningAccount = nil;
    
    provisioningAccount = [_dictionaryProvisioningAccount objectForKey:userId];
    
    return provisioningAccount;
}

- (void) setCProvisioningAccount:(HOPProvisioningAccount*) account forUserId:(NSString*) userId
{
    [_dictionaryProvisioningAccount setObject:account forKey:userId];
}
/*
- (IStackPtr) getStackPtr
{
    return stackPtr;
}
- (void) setStackPtr:(IStackPtr) inStackPtr
{
    stackPtr = inStackPtr;
}

- (boost::shared_ptr<OpenPeerCallDelegate>) getOpenPeerCallDelegate
{
    return openPeerCallDelegatePtr;
}
- (void) setOpenPeerCallDelegate:(boost::shared_ptr<OpenPeerCallDelegate>) inOpenPeerCallDelegate
{
    openPeerCallDelegatePtr = inOpenPeerCallDelegate;
}

- (boost::shared_ptr<OpenPeerStackDelegate>) getOpenPeerStackDelegate
{
    return openPeerStackDelegatePtr;
}
- (void) setOpenPeerStackDelegate:(boost::shared_ptr<OpenPeerStackDelegate>) inOpenPeerStackDelegate
{
    openPeerStackDelegatePtr = inOpenPeerStackDelegate;
}

- (boost::shared_ptr<OpenPeerMediaEngineDelegate>) getOpenPeerMediaEngineDelegate
{
    return openPeerMediaEngineDelegatePtr;
}
- (void) setOpenPeerMediaEngineDelegate:(boost::shared_ptr<OpenPeerMediaEngineDelegate>) inOpenPeerMediaEngineDelegate
{
    openPeerMediaEngineDelegatePtr = inOpenPeerMediaEngineDelegate;
}

- (boost::shared_ptr<OpenPeerConversationThreadDelegate>) getOpenPeerConversationThreadDelegate
{
    return openPeerConversationThreadDelegatePtr;
}
- (void) setOpenPeerConversationThreadDelegate:(boost::shared_ptr<OpenPeerConversationThreadDelegate>) inOpenPeerConversationThreadDelegate
{
    openPeerConversationThreadDelegatePtr = inOpenPeerConversationThreadDelegate;
}*/
@end