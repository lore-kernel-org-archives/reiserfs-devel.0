From: Oleg Drokin <green@namesys.com>
Subject: Re: Re: Strange Syslog messages - this is NOT an isolated case!
Date: Mon, 30 Sep 2002 18:22:52 +0400
Message-ID: <20020930182252.A3811@namesys.com>
References: <20020930125753.5d05d7ea.fionn@unix-ag.org> <20020930150940.A26589@namesys.com> <20020930155629.07d32ecb.fionn@unix-ag.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020930155629.07d32ecb.fionn@unix-ag.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fionn Behrens <fionn@unix-ag.org>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 30, 2002 at 03:56:29PM +0200, Fionn Behrens wrote:

> Is there any place to check for an explanation what exactly is different with
> newfiles versus old files (save from the source that is)?

Sure.
Here's some stats: http://www.namesys.com/faq.html#reiserfsspecs

Also on v3.6 FS's you can have volume labels/uuids, extended inode attributes,
better NFS interoperability and may be something else I forgot.
I guess I really need to add that into our FAQ, too.

> Ah - and regarding the hash change: I guess it wont be done with $25, would it

It's unlikely for such a feature to take only one hour of development.

Bye,
    Oleg
