From: Timothy Webster <tdwebste2@yahoo.com>
Subject: Re: Several questions about encrypted filesystem
Date: Tue, 17 Jun 2003 09:17:25 -0700 (PDT)
Message-ID: <20030617161725.17287.qmail@web80507.mail.yahoo.com>
References: <3EEEFE60.4C86EEE6@namesys.com>
Reply-To: tdwebste2@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EEEFE60.4C86EEE6@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shushkin <edward@namesys.com>, "Zhao, Forrest" <forrest.zhao@intel.com>
Cc: reiserfs-list@namesys.com

Hi,
The first question in my mind is always key
management. By that I mean, where are the keys stored,
how are does key rotation occurr, who holds the keys
for shared files, (by this I mean serveral authers
contributed to a file).

1) Shared files, and file parts.
In order to address this situation. Access needs to be
broken into parts, authenication, authorization,
encryption/decryption. These can be though as an
"signed authenication module", "trusted authorization
database server", "signed encryption/decryption
module". By signed and trusted, I mean the local
authenication and encryption modules care out a secure
hand shake with the authorization server. The
authenitcation module must prove that its code trust
worthy to the authorization server. And the
authorization server must prove to the authenication
module that it is "the" authorization server the
authenication module was designed to trust. And
similarly for the encryption/decryption module.
Why all this work? So that each can be run by
different users perhaps on different hosts, such as
"SAN".

2) Key rotation and backups
Over time the number of keys quickly become
prohibitive. You need to in stead store the "seed key
and the dimension" of multi-dimension key space. The
multi-dimension key space is actually several key
spaces combined to make a higher dimensional key
space. 
The key space is created by sequencal encryption of
the seed key inserted into dimension space controlled
by a "secure" psedo-random walk. When a new key is
required it is taken form the mult-dimensional key
space as the next index number. Keys don't need to use
all the deminsion in its index number. Which allows
transition to new key spaces as old ones get filled.
Or Remote sites which will ofcourse have different key
spaces.

At some point in the future a particular key is
required, it is retrived by first regenating the key
space, then using the key in the key space specified
my the "particular" key's index number. There is no
reason that the key's index number and key space
"number" can not be stored in the clear, lets say in
the file header.

Using this method there is basically unlimited keys
available, and they can be stored and retrived
efficently.


This is brief and incomplete.
-tim
 

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com
