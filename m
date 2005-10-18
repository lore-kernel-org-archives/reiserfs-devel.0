From: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Subject: Re[2]: reiser4 and laptop_mode
Date: Tue, 18 Oct 2005 15:47:07 +0600
Message-ID: <689595617.20051018154707@usu.ru>
References: <19812996093.20051017162429@usu.ru> <43542DE1.7050700@slaphack.com>
 <43545DCF.1070301@namesys.com>
Reply-To: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43545DCF.1070301@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi, all,

HR> We should work to integrate well with it.  Zam, can you look at that?
HR> Thanks.
I was looking through linux-2.6.10 sources this morning and did not found
laptop_mode anywhere in filesystem-specific code (except xfs). I'm not
a kernel hacker but it seems to me that laptop_mode is compatible with
everything which have customizable committing period. laptop_mode
tools (shell scripts which are used to activate this feature) do
mainly two things: they set up commit period in
/proc/sys/vm/laptop_mode (this data is used later in pdflush
controlling code etc), remount filesystems with -o
commit=laptop_mode_value and set read-ahead value for hd[a-z].

Am I right?

P.S. Thanks for the replies.

Best regards,
Valentine

