From: Oleg Drokin <green@namesys.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 19:35:24 +0400
Message-ID: <20020516193524.C2877@namesys.com>
References: <OF4598EC34.B53F2A48-ON85256BBB.00531156@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF4598EC34.B53F2A48-ON85256BBB.00531156@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, May 16, 2002 at 10:11:37AM -0500, Steve Pratt wrote:
> >> superblock. Neither 3.5 nor 3.6 superblock appear to have a label field,
> >> but mkfs has an option for it.
> >Labels are supported in reiserfs v3.6 format. (2.4 supopr was merged into
> >2.4.19-pre3, if I remember correctly).
> Ok, so it looks like I can use the option and if they have the right kernel
> code it will just work.

In fact even kernel without "support" will work.
Support is only means that the space in superblock is marked as used by
label/uuid instead of being marked as "reserved".
You cannot query uuid/label from withing the kernel, anyway.

> >You can circumvient this by echo Yes | reiserfsck ...
> >if you need.
> Actually this is not trivial in fork/exec in C code.  Especially when I

I think it is.

> want to preserve the return code from the fsck.  If you know of a coding
> trick to do this I would be interested.

Basically it is (half pseudocode):

ifd=create_input_pipe(&pifd); // 
ofd=create_output_pipe(&pofd); // these 2 would return fds suitable for child
			       // and modify fds suitable for parent.
			       // in fact simple pipe(2) is what you need.
if (!fork()) {
	close(0);
	close(1);
	close(2);
	dup2(ifd,0);
	dup2(ofd,1);
	dup2(ofd,2);
	close(ofd);
	close(ifd);
	execl("/path/reiserfsck","reiserfsck","param1","param2",...);
}
close(ofd);
close(ifd);
read_len=read(pofd,&buffer, 100000); // nonblocking read in fact.
print_message(buffer, read_len); // Hans wants you to print mkreiserfs/reiserfsck banner on screen.
write(pifd, "Yes\n", 4);
read_len=read(pofd,&buffer, 100000); // nonblocking read in fact. probably in a loop
				     // Here you can even provide user with
print_message(buffer, read_len);     // progress information.

wait(&exitcode);
close(pifd);
close(pofd);
analyze_exitcode_and_notify_user(exitcode);

Bye,
    Oleg



