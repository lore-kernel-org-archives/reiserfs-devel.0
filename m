From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] reiserfs v3 fixes and features
Date: Fri, 16 Apr 2004 11:44:49 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87zn9capvy.fsf@uhoreg.ca>
References: <1081274618.30828.30.camel@watt.suse.com> <1081989006.27614.110.camel@watt.suse.com>
 <874qrmkl43.fsf@uhoreg.ca> <16510.31796.137286.428042@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17999-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Nikita" == Nikita Danilov <Nikita@Namesys.COM> writes:

>> On 2.6.5, it still fails:
>> 
>> ...
>> CC      fs/reiserfs/bitmap.o
>> In file included from fs/reiserfs/bitmap.c:8:
>> include/linux/reiserfs_fs.h: In function `reiserfs_transaction_running':
>> include/linux/reiserfs_fs.h:1752: error: structure has no member named `journal_info'
>> make[3]: *** [fs/reiserfs/bitmap.o] Error 1

Nikita> Err.. clash with the reiser4 patch, surely.

OK.  Is there a workaround or updated patch?  Or do I have to choose
between Reiserfs 3 data=ordered and Reiser4?

Thanks

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

