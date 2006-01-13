From: Hans Reiser <reiser@namesys.com>
Subject: Re: Authoring a versioning plugin
Date: Fri, 13 Jan 2006 12:34:11 -0800
Message-ID: <43C80EC3.7050003@namesys.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <200601121014.37940.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601121014.37940.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>

Peter van Hardenberg wrote:

>Hi Yoanis, good to see you're still pursuing this.
>
>On January 11, 2006 02:59 pm, Yoanis Gil Delgado wrote:
>  
>
>>This are the intentions:
>>To write a versioning plugin that will allows the file system user to
>>easily revert the files under versioning to a some previous state.  The
>>plugin will allow to revert the file state, based on revisions number and
>>date modifications(and not sure about this one). There will be a special
>>pseudo file named "previous" that will return the previous version of the
>>file. The final result should allow to the the following actions:
>>
>>$ echo 1 > myfile.txt  (let's say we make this command at Wed Jan 11
>>16:53:55) $ echo 2 > myfile.txt  (let's say we make this command at Wed Jan
>>11 16:54:57) $ echo 3 >> myfile.txt (let's say we make this command at Wed
>>Jan 11 16:55:59)
>>
>>Suppose you want the latest version, then you type:
>>$ cat myfile/.../previous
>> Some other content
>>Or you want the n-th version, then you type:
>>$ cat myfile/.../1
>> Some content
>>$ cat myfile/.../2
>> Some other content
>>$ cat myfile/.../3
>>    
>>
>
>This is going to clutter the ... directory rather a lot. Instead of adding 
>more files into "...." (which, by the way, is completely obscure) I would 
>suggest you create a new pseudo directory.
>
>Perhaps:
>$ cat myfile/.^4/history/previous
>$ cat myfile/.^4/history/version/1
>still not quite right, but at least it contains a bit more information about 
>what the "1" refers to.
>  
>
Ok, lets use myfile/..../versions/1 etc.

>
>I imagine that attribute should be
>$ echo "1" > myfile.txt/..../plugins/versioning
>or
>$ echo "everywrite" > myfile.txt/..../plugins/versioning
>
>Unfortunately, my experience is that you cannot use "echo" to change the data 
>in the plugins/* pseudoplugins, even when it should be legal to do so. I just 
>had a little ruby script that looked roughly like this:
>
>f = open pseudofile;
>f.write('newplugin');
>f.close;
>
>Never had the time to figure out why that was necessary, but there it is. 
>(There is a comment on the plugin-wiki gotchas section.)
>  
>
If someone figures out why we can't do it but /proc can, or even fixes
it, it would be good.

