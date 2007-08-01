From: Edward Shishkin <edward@namesys.com>
Subject: Re: 2.6.23-rc1-mm2 Invalid argument on some files, depends on file
 contents?
Date: Thu, 02 Aug 2007 03:48:44 +0400
Message-ID: <46B11BDC.8050608@namesys.com>
References: <1186005421.9066.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1186005421.9066.9.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zan Lynx <zlynx@acm.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Zan Lynx wrote:

>Several of my files have been doing this.  I really noticed it when I
>ran a backup last night and there were many of these errors.  It has
>also started affecting documents I really care about.
>
>I was wondering if I somehow have compression enabled.  I didn't do it
>on purpose! :)
>
>  
>

If so, then definitely _no_.

>I remember reading some comment about lzo being messed up and the
>patches not included in mm yet?  This is rc1-mm2 so I thought it might
>be fixed, but I guess not.
>  
>

Reiser4 in rc1-mm2 is already ported to the new lzo, however this library
is not used by default (unix-file) plugin.

>Here is a snippet of a shell session showing the problem.  It's a good
>thing it didn't affect the OpenOffice format original!
>
>$ cat * >/dev/null
>cat: URL Database Design.doc.backup: Invalid argument
>$ cp URL\ Database\ Design.doc.backup{,.test}
>$ cat * >/dev/null
>cat: URL Database Design.doc.backup: Invalid argument
>cat: URL Database Design.doc.backup.test: Invalid argument
>$ echo blah >> URL\ Database\ Design.doc.backup.test 
>$ cat * >/dev/null
>cat: URL Database Design.doc.backup: Invalid argument
>$ ls -l
>-rw-r--r-- 1 lynx users 286720 2007-07-31 18:16 URL Database Design.doc.backup
>-rw-r--r-- 1 lynx users 286725 2007-08-01 15:48 URL Database Design.doc.backup.test
>-rw-r--r-- 1 lynx users 154915 2007-07-31 16:53 URL Database Design.odt
>-rw-r--r-- 1 lynx users 154915 2007-07-31 18:16 URL Database Design.odt.backup
>
>As you can see, a copy shows the same problem.  But adding "blah\n" to
>the end makes the problem go away...
>  
>

Yeah,  I have also noted this badness: if file size % page size == 0, 
then md5sum
complaints.

This is one more bug in new file_read: if vfs asks to read page out of 
file size,
then fs should fill it by zeros (reiser4 returns -EINVAL instead). I'll 
prepare the
patch a bit later..

Thanks,
Edward.
