From: Edward Shushkin <edward@namesys.com>
Subject: Re: Reiser4 crypto-compression design
Date: Wed, 26 Mar 2003 20:03:40 +0300
Sender: edward
Message-ID: <3E81DD6C.AA9B5A92@namesys.com>
References: <3E80B384.2190B074@namesys.com> <20030325202319.GT9317@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13391-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com, Pierre Abbat <phma@webjockey.net>, reiser@namesys.com

Hendrik Visage wrote:
> 
> On Tue, Mar 25, 2003 at 10:52:36PM +0300, Edward Shushkin wrote:
> > All
> > the compression issues for the traditional approach described in the
> > following paper:
>  http://www.namesys.com/compression.txt
> 
> >   When user creates a crypto-file, the file system asks for a secret
> > key and calculates its id (128-bit word) which supposed to be stored
> > in file's stat-data on disk.
> 
> What about Public-Private key setups?

Hans, do we need public-private interface in reiser4?

> Ie. using a Public key to encrypt the data (Or at least encrypt the
> shared key with the public key).

  You mean whether Alice can read a file, which Bob created by Alice's
public key? 
  I think yes. Alice just need to post her 128-bit key-id as a part of her
public key, BUT next time Bob won't be able to open the file he just created
for Alice (he will need Alice's private key for this). This is because the
file system  won't distinguish Bob from other users which don't have Alice's
private key. At the same time, the file system should ask for a secret (private)
key when someone tries to open existing crypto-file, since there can be decrypted
data in page cache intended only for Alice. So the only thing that Bob will be
able to do is delete this file as an owner, but not read. This inconvenience 
probably can be eliminated by using shared keys (although it doesn't provide 
a great security: if I remember correctly, shared key is a private key which
is known by group of certain users.. ) 
  I want to specify precisely, what is 128-bit key-id. 
Our private(secret) key consists from two parts: 
1) key required by crypto algorithm to decrypt data
2) special random string which was created during key generation procedure.
  In order to calculate key-id we decrypt (2) by (1) and apply to the result 
a crypto-stable hash function. This key-id supposed to be stored in stat-data
and is used by the FS to identify private key. Also this key-id is a part of
public key which is a pair:
a) key required by crypto algorithm to encrypt data
b) key-id
Obviously, public key makes sense only for asymmetric crypto algorithms.

> Also, there might/would be the need for
> escrow(Right term?) keys. Ie. keys that the Security Officer 

is it a kind of shared key?

> could use to decrypt data (In case of bus accident or dismissal etc.)
> 
> Or rather, how will the FS "ask"/request a key for decryption in a secure way?

So when user creates new crypto-file and writes into it, the FS requires only a 
public key (his own, or someone's else). For all future accesses to this crypto-file
the FS will require both keys (private key for access and read, and public key 
for write); it may be the same key if crypto algorithm is symmetric).

Thanks for interesting question, 
Edward.

> 
> Hendrik
