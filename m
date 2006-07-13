From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: another semantic storage system (in userspace)
Date: Thu, 13 Jul 2006 16:30:51 -0400
Message-ID: <87veq1z1qc.fsf@evinrude.uhoreg.ca>
References: <87veq233dm.fsf@evinrude.uhoreg.ca>
	<20060713170626.GE31144@HAL_5000D.tc.ph.cox.net>
	<44B6850F.9010801@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B6850F.9010801@namesys.com> (Hans Reiser's message of "Thu, 13
	Jul 2006 10:38:23 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, 13 Jul 2006 10:38:23 -0700, Hans Reiser <reiser@namesys.com> said:

> Clay Barnes wrote:

>> 1) Scope
>> a) Should the semantic content of files be purely user-defined?

> Yes.

I guess this also raises the question of how multiple users on the same
machine can define their own semantic content (e.g. if user A wants to
index some new file format, but doesn't want to have to bug the
administrator to add support for it).  Will the filesystem be talking to
some userspace daemons?

-- 
Hubert Chan - email & Jabber: hubert@uhoreg.ca - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA   (Key available at wwwkeys.pgp.net)
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA

