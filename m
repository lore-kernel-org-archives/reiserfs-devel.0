From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Beginner questions about meta data and plugins
Date: Thu, 1 Apr 2004 19:16:03 +0400
Message-ID: <16492.12851.643230.987144@laputa.namesys.com>
References: <20040401150800.68309.qmail@web10005.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040401150800.68309.qmail@web10005.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivar Bergman <ivarbergman@yahoo.com>
Cc: reiserfs-list@namesys.com

Ivar Bergman writes:
 > 
 > Hi all!
 > 
 > Over the last weeks I have been experementing with 
 > Reiser4, so far I have managed to build the kernel,
 > created a mountable Reiser4 partition, and played
 > around with the file system via the shell. 
 > 
 > To learn how Reiser4 work, I planed to implement the
 > following two programs:
 > 
 > 1, Write a simple C program that list the value of a 
 >    specific file meta data. Like the way you can list 
 > 
 >    the value of a attibute by using cat.
 > 
 >    cat myfile/..pseudo
 > 
 > 2, Write a simple plugin that adds a new file 
 >    attribute.
 > 
 > I tried to read the kernel source code for help, but I
 > guess it was a bit to much for me. So, does anybody
 > have some source code that could help me on the way,
 > or perhaps point out some part of the resier4 kernel 
 > source code that could be helpfull.

Take a look at fs/reiser4/plugin/pseudo/pseudo.c, where most pseudo
files are implemented. Pattern you test-plugin after some example, like
metas/uid (implemented by show_uid() and get_uid()). You will have to
add new element to the reiser4_pseudo_id enum defined in
fs/reiser4/plugin/pseudo/pseudo.h.

 > 
 > Some general quiestion about plugins: 
 > 
 >  o Does a file belong to one plugin only, or does it 
 >    have a list of plugins?
 >  
 >  o Can I, as a plugin writer, introduce new operations
 > 
 >    on a file? In other words extend the file
 > interface.
 >    And if that is possible, how do I invoke that   
 >    operation from a C program?

Pseudo files are designed to extend file interface. If you need new
file operation "foo", it can be accessed through normal
read/write/readdir operations on
file/WHATEVER-PSEUDO-PREFIX-IS-FASHIONABLE-TO-DAY/foo.

This principle is applicable to pseudo files themselves, that is, they
also may have pseudo files hanging from them.

 > 
 > Best regards
 > Ivar Bergman
 > 

Good luck.
Nikita.
