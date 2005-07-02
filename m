From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Sat, 02 Jul 2005 18:09:15 -0500
Message-ID: <42C71E9B.8050808@slaphack.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>	<42BF08CF.2020703@slaphack.com>	<200506262105.j5QL5kdR018609@turing-police.cc.vt.edu>	<42BF2DC4.8030901@slaphack.com>	<200506270040.j5R0eUNA030632@turing-police.cc.vt.edu>	<42BF667C.50606@slaphack.com>	<5284F665-873C-45B7-8DDB-5F475F2CE399@mac.com>	<42BF7167.80201@slaphack.com>	<EC02A684-815A-4DF8-B5C1-9029FE45E187@mac.com>	<42C06D59.2090200@slaphack.com>	<CD59AE36-FD15-4A4C-9E1D-AB2F8B52D653@mac.com>	<42C08B5E.2080000@slaphack.com>	<87y88vrzkg.fsf@evinrude.uhoreg.ca>	<EBD8F590-0113-4509-9604-E6967C65C835@mac.com>	<87mzpbrvpf.fsf@evinrude.uhoreg.ca>	<D3A4ABBF-8062-4399-B1EC-61722295944A@mac.com>	<87irzzrqu7.fsf@evinrude.uhoreg.ca>	<2B1C058D-C304-4E15-ACDA-C3337E67E981@mac.com>	<87d5q6pdyv.fsf@evinrude.uhoreg.ca>	<C7DB345A-CD35-4A4C-89F7-5BBD3CB83DF4@mac.com>	<874qbiey92.fsf@evinrude.uhoreg.ca>	<42C50804.4050006@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050702142846.78af7891.petchema@concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?UGllcnJlIEV0Y2hlbWHDr3TDqQ==?= <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

Pierre Etchemaïté wrote:
> Le Fri, 01 Jul 2005 04:08:20 -0500, David Masover <ninja@slaphack.com> a écrit :
> 
> Hi all,
> 
> 
>>Metafs also avoids having to patch tar.  It's assumed that legacy backup 
>>systems can always avoid metafs and still catch almost everything 
>>important, and certainly everything they already do catch.  With a 
>>hybrid or an entirely new backup system, we could catch everything, 
>>including any new ACL-like animals that people invent.
> 
> 
> As an administrator, a way to perfectly save and restore the content of
> file systems is a requirement. Crashes do happen, so do migration to new
> disk subsystems, system cloning, etc, etc.

I would suggest a plugin which produces a dump of the active FS.  It's 
how XFS seems to do it, after all, only you don't need the commandline tool.

> If restoration can be done with the standard tools you find on any live
> rescue CD, it's even better.

Any good XFS-enabled CD will have xfsdump.  Similarly, any good 
Reiser4-enabled CD will have whatever we feel like putting there.

Can ACLs currently be backed up with any other tool than some sort of dump?

> All what's probably needed is some readable-writable non-confusing
> (fully POSIX compliant) "view" that's guaranteed to contain all existing
> "raw" data and metadata).

The danger here is that things beyond POSIX must either be encoded into 
the file somehow.  If we add a thumbnail property to a certain type of 
file, and the file format itself doesn't allow for any extra data, we 
can either choose to have a separate view entirely for backup so that 
the "backup" view (which forces the metadata into the file anyway) is 
separate, or we can choose to accept that existing backup tools will 
catch existing attributes that they were programmed to expect, and all 
new stuff can be handled by some sort of dump.

I say "some sort of dump" because a separate backup view, because it 
makes some files unusable except for transport, is effectively a dump, 
only shown as a tree, instead of a single file.  But as long as we're 
doing that, we may as well provide an actual dump plugin so that one can 
do "gzip /metas/some/where/.../dump > /mnt/some/backup/medium".  It'd be 
more efficient than tar for that sort of thing.

Both are useful, though -- the tree is better for rsync backups, if 
you're either using /meta on the other end or are planning to only 
restore to a /meta enabled system.  I think we should do both ways.


