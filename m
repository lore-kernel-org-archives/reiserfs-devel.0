From: Christian Stroetmann OntoLab <stroetmann@ontolab.com>
Subject: Re: The reiser4 ....SDK for experiments outside kernel
Date: Fri, 12 Dec 2008 00:04:30 +0100
Message-ID: <49419C7E.9040401@ontolab.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <494062F6.2040809@gmx.de> <4940FB0E.8050102@gmx.de> <494105EB.3080204@gmx.de> <80294dc60812110636m70178aa3m4493e65fe4be302e@mail.gmail.com> <ghrhkn$9ht$1@ger.gmane.org> <494165A4.6040207@gmail.com> <ghrraa$dsv$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <ghrraa$dsv$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralph <eulenreich@gmx.de>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Dear Ralph;
You wrote:
> Edward Shishkin wrote:
>   
>> Be careful with the notion of plugin: in reiser4 this is only
>> to manage low-level data storage infrastructure.. That said,
>> first, you should decide what (useful!) feature related to
>> (low-level!) data storage do you want to implement, then think
>> how to implement it in the plugin categories. Most likely you'll
>> need to add new plugin(s) of existing or (unlikely) new interface.
>> For example, in order to support (meta)data checksums you'll need
>> a new node format, and, hence, new node plugin (the NODE interface
>> already exists).
>> All other "plugins" should go to vfs, or to various stackable
>> (distributed) filesystems.
>>     
>
> (meta)data like xattr low-level?
>
>   
>> in reiser4 this is only to manage low-level data storage infrastructure
>>     
> ... at this stage of reiser4 is low-level, because the main effort is inclusion in mainline kernel, I thought...
>
> What if you want to write a storage backend for postgresql where content shall be readable per file syntax: 
> cat ./database/contacts/names/name/address/streetname
> (Sure, you can have a postgresql service that exports streetnames....) ??
>
> Look at: H. Reiser writes: 
> "I am going to do the enhanced semantics first"
> ( http://marc.info/?l=reiserfs-devel&m=115363946628080&w=2 )
>
> That is not so low-level ?
> But, as Chistian Stroetmann just said in this thread:
> Namesys philosophy is different than actual reiser4 
> aimings?
>   
Despite the fact that I'm unable to follow the logics of the whole 
thread, I would like to clarifiy that:
I haven't said this. I said (now in full length), that the vision of the 
corporation Namesys for the further development of its system (including 
reiser4 or a successor system) was different after the given 
informations on the not anymore existing Namesys website, than the 
vision of the Linux based project (which I'm not allowed to name here) 
by our corporation. There were no claims about some kinds of actual 
reiser4 aimings.
> Ralph
>
> --
Regards
C. Stroetmann
