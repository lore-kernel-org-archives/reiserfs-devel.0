From: Anders Widman <andewid@tnonline.net>
Subject: Re: Archiver
Date: Mon, 28 Apr 2003 12:50:26 +0200
Message-ID: <161351974.20030428125026@tnonline.net>
References: <3EACFF00.6030507@gbf.de> <3EAD0062.7060603@namesys.com>
 <3EAD05FD.3080107@gbf.de>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EAD05FD.3080107@gbf.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joachim Reichelt <Reichelt@gbf.de>
Cc: reiserfs-list@namesys.com



> Hans Reiser schrieb am 04/28/2003 12:20 PM:

>> Joachim Reichelt wrote:
>>
>>> Dear all,
>>>
>>> I know, it is a little bit out of topic, but we are looking for 
>>> Software to archive our data held on
>>> ~400GB reiser fs.
>>> We want to have exact one copy on tape of each file that is on our 
>>> system at e.g. midnight.
>>> Only new or changed files should go to tape.
>>> Tapes are in an robot system of ~2TB.
>>>
>> lvm snapshots and dd or tar?
>>
> The data are on hardware raid, no lvm.
> Tar: How to exclude all file the are on tape jet?
> Where/How to find old files?
> I think of features as seen in legatho, something like a HSM system


   How  can  you without snapshots of the filesystem be able to backup
   from one point in time? I mean if the filesystem changes during the
   backup  you may loose (miss to backup) data that is changing/moving
   or get partial files.

   Otherwise  it  should  not be such a big problem to use tar to copy
   files  that  are  changed after a certain date (last backup). Check
   the tar manpage :)

   //Anders



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

