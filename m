From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 7 Sep 2004 18:25:51 +0200
Message-ID: <1401724342.20040907182551@tnonline.net>
References: <200409070206.i8726vrG006493@localhost.localdomain>
 <413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
 <1183150024.20040907143346@tnonline.net>
 <413DD5B4.nailC801GI4E2@pluto.uni-freiburg.de>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-21576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413DD5B4.nailC801GI4E2@pluto.uni-freiburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org


  

> Spam <spam@tnonline.net> wrote:

>>   One suggestion is missed. It is to provide system calls for copy.
>>   That would also solve the problem.

> No, it would not. If you read the POSIX.1 specification for cp
> carefully <http://www.unix.org/version3/online.html>, you will
> notice that the process for copying a regular file is carefully
> standardized. A POSIX.1-conforming cp implementation would not
> be allowed to copy additional streams, unless either additional
> options are given or the type of the file being copied is other
> than S_IFREG. And cp is just one example of a standardized file
> handling program.

  It would solve the problem in Linux. However, it may not be POSIX.1
  compatible. On the other hand I read that NTFS 5.0 is POSIX.1
  compliant - and Windows uses copy system call. NTFS also has streams
  support using special character in the file names to select the
  streams.

  Surely there must be a solution in Linux that will allow things like
  streams and meta-data(meta-streams) be visible to the user.
  ~S

> 	Gunnar


