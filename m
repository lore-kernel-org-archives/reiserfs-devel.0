From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Proposal for keying encrypted filesystem
Date: Tue, 1 Apr 2003 11:31:41 +0200
Message-ID: <20030401093141.GE11927@hvs.envisage.co.za>
References: <200303282026.23543.phma@webjockey.net> <200303311511.40537.phma@webjockey.net> <20030331213104.GZ8452@hvs.envisage.co.za> <200303311740.24288.phma@webjockey.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303311740.24288.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

On Mon, Mar 31, 2003 at 05:40:24PM -0500, Pierre Abbat wrote:
> On Monday 31 March 2003 16:31, Hendrik Visage wrote:
> > On Mon, Mar 31, 2003 at 03:11:40PM -0500, Pierre Abbat wrote:
> > > You need to add the PID to the tuple used to ask for the key. That way a
> > > process and its children can access a file, but other processes running
> > > with the same UID cannot. This is necessary for trusted encrypted backup.
> >
> > Agreed.
> >
> > However if the key database/engine doesn't have access to an
> > already decrypted key, then it would return an error. That way the backups
> > would only be able to copy the file verbatim (ie. un-decryptable) to the
> > backup medium. Ie. the backups run while the user haven't logged in to
> > enable decryption. Or am I missing the definition of "trusted encrypted
> > backups"?
> 
> I don't understand "if the key database/engine doesn't have access to an 
> already decrypted key".

ie. for your example below, a reiserfskey haven't yet executed.

Note, my view on the key database is that it shouldn't be limited to
single instance/machine, rather it would be able to communicate with
others or a central key database to exchange keys.

> Here's the protocol I'm thinking of:
> Alice starts an SSH session to Bob, the backup server. Alice tells Bob to run 
> "reiserkey -a 1 pa55phrase", which puts the passphrase in the key database as 
> being accessible by the SSH session. Alice then starts rsync and tells it to 
> use the already existing SSH session (I don't know how to do this, but it 
> might be doable) to start rsync on Bob. Alice backs up her data to Bob, but 
> no process that is not a child of the SSH session can read the backup on Bob, 
> even if Bob becomes the UID that Alice is using. When she is finished, Alice 
> runs reiserkey again to remove the passphrase from the key database.

A very specific case, which could be easily handled with some PAM magic 
to negate the need for a reiserkey execution by the user as it could be
done on the fly, but that is getting OT as it would/should be part of an
external process (read key database specific :) that would make the decision.

The case I had in mind was where you are backing up encrypted files to tape.

Hendrik
