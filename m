From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 31 Mar 2003 17:40:24 -0500
Message-ID: <200303311740.24288.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200303311511.40537.phma@webjockey.net> <20030331213104.GZ8452@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331213104.GZ8452@hvs.envisage.co.za>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 31 March 2003 16:31, Hendrik Visage wrote:
> On Mon, Mar 31, 2003 at 03:11:40PM -0500, Pierre Abbat wrote:
> > You need to add the PID to the tuple used to ask for the key. That way a
> > process and its children can access a file, but other processes running
> > with the same UID cannot. This is necessary for trusted encrypted backup.
>
> Agreed.
>
> However if the key database/engine doesn't have access to an
> already decrypted key, then it would return an error. That way the backups
> would only be able to copy the file verbatim (ie. un-decryptable) to the
> backup medium. Ie. the backups run while the user haven't logged in to
> enable decryption. Or am I missing the definition of "trusted encrypted
> backups"?

I don't understand "if the key database/engine doesn't have access to an 
already decrypted key".

Here's the protocol I'm thinking of:
Alice starts an SSH session to Bob, the backup server. Alice tells Bob to run 
"reiserkey -a 1 pa55phrase", which puts the passphrase in the key database as 
being accessible by the SSH session. Alice then starts rsync and tells it to 
use the already existing SSH session (I don't know how to do this, but it 
might be doable) to start rsync on Bob. Alice backs up her data to Bob, but 
no process that is not a child of the SSH session can read the backup on Bob, 
even if Bob becomes the UID that Alice is using. When she is finished, Alice 
runs reiserkey again to remove the passphrase from the key database.

