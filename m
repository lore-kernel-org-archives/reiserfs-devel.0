From: Hans Reiser <reiser@namesys.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Tue, 03 Aug 2004 22:44:46 -0700
Message-ID: <411077CE.9000003@namesys.com>
References: <410D96DC.1060405@namesys.com> <410F6FEE.10502@superbug.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19957-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410F6FEE.10502@superbug.demon.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: James Courtier-Dutton <James@superbug.demon.co.uk>
Cc: ReiserFS List <reiserfs-list@namesys.com>

James Courtier-Dutton wrote:

> Hans Reiser wrote:
>
>> You can think of this as chroot on steroids.  The idea is to use the 
>> concept of views, in which one specifies a description of what in the 
>> fs should be visible in the view, and extend them to become "tracing 
>> views" which automate the creation of "viewprints", which contain 
>> what a process attempted to access during some period when it was 
>> being supervised, and then use these viewprints to conveniently 
>> specify a view that defines what the process should be allowed to 
>> access.  It is not that this is better than chroot, it is that it is 
>> to be made much less human work to use than chroot, as chroot is used 
>> much too rarely in practice.
>>
>> Another concept of the proposal is that of process oriented security, 
>> as opposed to the object oriented security usual to filesystems.  
>> These viewprints will be associated with the executables of the 
>> processes being isolated, not with the files, and this is 
>> academically amusing as a distinction I think.
>>
>> You can find details of our proposal at 
>> www.namesys.com/blackbox_security.html.  You have to be able to 
>> perform the work in the US (a government requirement for this 
>> contract), which means that I cannot use my current Russian staff 
>> (the US State department is making it hard to get visas these days).
>>
>> If you have an interest in filesystems, views, security, and the 
>> linux kernel, you might find it fun.  It should be a nice opportunity 
>> for an ambitious young software architect, and I like to think that 
>> the people who work for me learn a bit.  The infrastructure you will 
>> help spec out will be useful for lots of other purposes besides 
>> security (version control, search refinement, etc.)  The work will be 
>> GPL'd, etc.
>>
>> If you would like to know more about namesys and reiser4, you can 
>> look at www.namesys.com
>>
>> Please email me directly if it interests you rather than just 
>> responding to the thread.
>>
>> Hans
>>
>>
>
> I am based in the UK so I cannot help directly. Unless the UK is close 
> enought to the USA in this matter.
>
> As a security feature, providing a restriction so that an application 
> cannot execute any code in any files it created, could go a long way 
> to reducing exploits.
>
> E.g.
> 1) Web application has a buffer overflow bug
> 2) cracker uses the exploit to create a file, with exploit code in it, 
> 3) cracker then executes the exploit code.
>
> If stage (3) could be blocked, for a particular application and all of 
> it's child processes, web servers would be slightly more secure.
> The "buffer overflow bug" could still be exploited, but it would be 
> much more difficult.
>
> If this was also combined with "fs views", one could ensure that the 
> web application only had access to programs in /usr/bin that it 
> actually needs to do it's job. E.g. If the web app does not have 
> access to any file transfer tools in /usr/bin, then the cracker cannot 
> create an executable, the cracker could not then download root kits so 
> easily.
>
> I might have missed it, but I have not seen features in linux yet, 
> that prevent a user from setting the "execute" bit on files that they 
> own.
>
> James
>
>
Hmm.  Yes, views should allow masking permissions.
