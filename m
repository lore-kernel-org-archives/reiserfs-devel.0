From: Anders Widman <andewid@tnonline.net>
Subject: Re: Multiple data streams...
Date: Wed, 2 Apr 2003 15:08:17 +0200
Message-ID: <114180866437.20030402150817@tnonline.net>
References: <6167696812.20030402112847@tnonline.net>
 <200304022240.57346.russell@coker.com.au>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304022240.57346.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> On Wed, 2 Apr 2003 19:28, Anders Widman wrote:
>>    Is this supported, or will it be supported by ReiserFS?
>>    I  use  this  feature quite quite much.. Maybe this is something to
>>    add to ReiserFS?
>>
>>    There is very brief info at Microsoft's website:

> Does MS support multiple data streams properly yet?

  Yes.  Since  Windows  2000.  It  is also integrated in filemanager and
  programs like Microsoft Word.

  Easy   test:  right-click  any  file  on  a  NTFS  volume  and  choose
  "summary". That information is stored in a data stream.

  Another test you could to from a prompt:

     echo test>test.txt
     echo hello>test.txt:h
     echo bye>test.txt:b

     more <test.txt
     more <test.txt:h
     more <test.txt:b

   And  yes,  the  data  streams are preserved with copy/xcopy and normal
   copy/move  operations in explorer - even over SMB connections to other
   NTFS drives.

> The last information I read about data streams indicated that commonly used
> operations (such as typing "copy" in a command-line session) would not work
> properly with multiple data streams.  Also many important programs such as
> anti-virus programs did not support it.

> The Linux API does not support multiple data streams.  Support for extended
> attributes has recently been added, this will do most things that you might
> want to do with multiple streams and does it in a standard way that is
> supported.

  Could you give an example of this? I use multiple streams for adding
  thumbnails  or  text files  to pictures I am working on... - just to
  give an example.

  //Anders




--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

