From: Jurgen Botz <jurgen@botz.org>
Subject: Re: secure delete?
Date: Mon, 22 Mar 2004 17:37:33 -0800
Message-ID: <405F94DD.80004@botz.org>
References: <1079691239.5767.7.camel@pear.st-and.ac.uk> <405AD31A.7070304@mweb.co.za> <20040319110748.GA30491@chihiro.cern.ch> <405AD9B5.80102@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405AD9B5.80102@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: KELEMEN Peter <Peter.Kelemen@cern.ch>, reiserfs-list@namesys.com

Somebody asked:
 > Is there a way to securely delete a file or directory in
 > ReiserFS ... ?

Hans Reiser answered:
> Encrypt everything is what will work best.

This actually isn't a good answer... the problem domains of
"secure my data" and "don't let anyone recover this data I'm
removing" are sufficiently different that one mechanism
probably can't address them both.

Specifically, encryption has the limitation that some of the
time you want your data un-encrypted (so that you can
access it) and that even when the data is encrypted the key
is recoverable by various means (like rubber-hose crypt-
analysis if nothing else.)

If I store a file on my encrypted filesystem and then
decide that this file is dangerous, and I'd rather not leave
any evidence of it ever having been there, removing it won't
be enough any more than it would be if the filesystem had
not been encrypted in the first place, because:

- If I remove it, it might still be recoverable by anyone
   who has access to my computer while the filesystem is
   mounted (i.e. decrypted).

- If I unmount the filesystem (so that it's encrypted) and
   "never mount it again" someone can still discover the key,
   which is presumably stored on disk somewhere and beat the
   passphrase out of me.

- I could remove the file containing the key, but then I'm
   back to needing a secure delete capability for that!

In short, secure delete capability is needed.  If the file-
system makes it impossible for an application program to
implement this (because of data logging) then the filesystem
itself needs to provide this capability.

:j




Why do you want to encrypt all data?  Well, one reason is to
protect against your machine being stolen and the thief then
having access to your data.

Why do you want secure delete?  One reason is the same as the
above, and encryption takes care of this.  But another reason
is to protect yourself from overzealous law-enforcement, and
probably encryption can't help you there because you won't
have time to
