From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sun, 30 Mar 2003 12:00:53 -0500
Message-ID: <200303301200.53330.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200303291549.08160.phma@webjockey.net> <20030330101226.GB3520@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030330101226.GB3520@hvs.envisage.co.za>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sunday 30 March 2003 05:12, Hendrik Visage wrote:
> In this whole discussion I'm still missing some references to research
> papers on this technique, as it still sounds to me like security by
> obscurity.

I didn't find this in research papers. I thought of it in the bathtub. The 
credential could be a private key, if you like. The method of setting the 
credential in some ancestor of the current process is designed to meet two 
objectives:
1. A script can run, and it and all of its children can access the encrypted 
files, whereas no other process can. This would be used by an encrypted 
backup server, so that the operator of the backup server cannot read the 
backups, even while they are being backed up. It could also be used on 
multiuser workstations; if a user logs in twice, he would also have to key 
the filesystem twice.
2. A computer can have an encrypted /home directory, which is keyed once, and 
then every user can access files in it, subject to the permission bits.

> On the key: I'd prefer it to be  "truely" randomly generated
> (ie. /dev/random and not /dev/urandom), and then it be encrypted.
> I'd prefer it to be encrypted with the public keys of all those that
> would need access to it.

If each file has a different key, and each key is generated with /dev/random 
and encrypted with public keys, making a directory containing thousands of 
files is going to be *very* slow.

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
