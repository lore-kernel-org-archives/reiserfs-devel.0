From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Protect/Backup Encrypted FS
Date: Sat, 09 Apr 2005 00:09:57 -0400
Message-ID: <873bu0si96.fsf@evinrude.uhoreg.ca>
References: <200504051448.55893.shakim@bluebottle.com>
	<200504091156.28552.shakim@bluebottle.com>
	<42573D9E.1050308@nauticom.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42573D9E.1050308@nauticom.net> (Chester R. Hosey's message of
 "Fri, 08 Apr 2005 22:27:42 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Chester" == Chester R Hosey <chosey@nauticom.net> writes:

Chester> As far as backing up a partition and restoring that backup, use
Chester> tar. GNU tar (which is almost certainly the default on
Chester> GNU/Linux systems) is quite full-featured and should be able to
Chester> serve your needs.

This should probably be obvious to anyone using encryption, but just in
case...
  If you back up using tar, don't store the tar file unencrypted.

Also, you should be encrypting your swap file, or else bits of your data
could end up there unencrypted.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

