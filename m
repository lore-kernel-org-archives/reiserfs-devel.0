From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 13:48:08 -0500
Message-ID: <OF3BC642C9.4C652EFA-ON85256BBB.0067189B@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: reiserfs-list@namesys.com



Jonathan Briggs wrote:
>On Thu, 2002-05-16 at 09:11, Steve Pratt wrote:

>> >You can circumvient this by echo Yes | reiserfsck ...
>> >if you need.
>>
>> Actually this is not trivial in fork/exec in C code.  Especially when I
>> want to preserve the return code from the fsck.  If you know of a coding
>> trick to do this I would be interested.

>This is not too hard.  I would do two forks, so that the main process
>does not get hung up writing Yes's.  So:

>Main Process:
>Create a pipe with pipe()
>Fork off your fsck.reiserfs and record the pid returned from fork.
>Fork off your Yes writer and record the pid returned from fork.
>Wait for your Yes writer with waitpid.
>Wait for your fsck with waitpid and collect the status.

>fsck Child Process
>Call dup2 to change standard input to your pipe output
>Close the original pipe input file descriptor.
>Close the original pipe output file descriptor.
>Exec fsck.reiserfs

>Yes writer Child Process:
>Close the pipe output file descriptor.
>Loop writing Yes into your pipe input.
>Should not need to worry about exiting, this process should get a
>SIGPIPE when other process exits.

Thanks, it looks like I will need to do this..

Steve



