From: Christian Stroetmann OntoLab <stroetmann@ontolab.com>
Subject: Re: reiser4 inclusion?
Date: Sun, 26 Apr 2009 10:53:03 +0200
Message-ID: <49F420EF.8030002@ontolab.com>
References: <alpine.DEB.2.01.0904181302440.6162@bogon.housecafe.de>	 <542E227E-E31D-496C-93FB-19393133297F@MailNewsRSS.com>	 <200904250153.33258.volkerarmin@googlemail.com>	 <2E9381E6-A09A-4330-9A61-C4B7D7CE0E71@MailNewsRSS.com>	 <49F2CF9A.1060202@inn.nl> <49F2D43F.90105@ontolab.com>	 <8c113a260904250416n28fbdacs682ef8e6859b7dbf@mail.gmail.com>	 <49F339A2.9080705@ontolab.com>	 <8c113a260904251204u41f90028n975006634ed99e59@mail.gmail.com>	 <49F36F4E.3000906@ontolab.com> <8c113a260904251404m51bb4f1fo9267fe72ddad2c54@mail.gmail.com> <49F39A39.6040401@ontolab.com> <loom.20090425T232902-807@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20090425T232902-807@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mat <jackdachef@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Dear Mat,
> Christian Stroetmann OntoLab <stroetmann <at> ontolab.com> writes:
>
>  
>> Dear Alli;
>>    
>>> On Sat, Apr 25, 2009 at 10:15 PM, Christian Stroetmann OntoLab
>>> <stroetmann <at> ontolab.com> wrote:
>>>  
>>>      
>>>> Dear Alli,
>>>>           
>>>>> Well, as you noted at the end of your reply, it is polite to reply to
>>>>> answers. Maybe you can be the one to start.
>>>>>
>>>>>                 
>>>> What am I doing since months?
>>>>             
>
> Hi guys,
>
> as an outsider let me try to explain what "OntoFS" is all about (from 
> what I
> understood):
>
> what Christian with OntoLab and other companies or organizations are 
> doing here
> is basic research and putting that research to practice:
>   
Research & Development yielding in real products, eg. Linux based 
distributions.
> "OntoFS" shall become a kind of versioning file system
> (http://en.wikipedia.org/wiki/Versioning_file_system) based on reiser4 
> (or
> another filesystem if it's not possible to use it). This in some way 
> follows
> Hans' vision of developing a filesystem in which everything is a file 
> and whose
> life can be tracked (to simplify it really roughly).
It is a really very rough description of one small facet.
>  
>
> On the other hand it shall also become an "ontological" filesystem
> (http://en.wikipedia.org/wiki/Ontology_%28information_science%29) with 
> which
> files can be managed directly on the filesystem level.
The descriptions in the wikipedia are partly misleading in a criminal 
sense. There really are to many bandwagon jumpers.
So I have to say: Sorry, but as the founder of this subject I would like 
to describe it myself.
>  If I recall correctly
> another of Hans' visions was to use reiser4 as kind of 
> database-filesystem which
> more and more today could become reality in association with ontology 
> and the
> so-called semantic Web or (on a simpler level)
Mr. Reiser has described the first half of the vision. With (the real) 
OntoFS the other half came to this game, especially the Semantic (World 
Wide) Web items. Mr.Reiser didn't use concepts like RDF or OWL. That's 
exactlly one of my inventions in the context of R4, which I made public 
and by this useable under the GPL.
>  semantic desktop (?) (see kde 4).
>   
This step was stolen from my OntoLinux website. Before I decided to take 
KDE there was no decision made by the Semantic Desktop.org research 
group to focus on KDE. (Mat you understood this wrong, who was first and 
who was second.) The other ideas taken by the Semantic Desktop.org from 
the OntoLinux website were to follow my steps, which are based on the 
well know concepts that in Unix everything is a file and that metadata 
is data. To give it the rest, the persons in the Semantic Desktop.org 
group tried to steal my concept and to get into the first place by 
defining an ontology for files.
The difference between OntoLinux and Semantic Desktop are now: OntoLinux 
is a full Linux based distribution with many other progressive features 
based on an ontological file/storage system, which is based on R4. 
Semantic Desktop is at the core an ontology-based clone. That means with 
the further development of R4 named OntoFS there is no need to use a 
special ontology. And if still persons think it is rude to talk about 
OntoFS in this mailing-list, then I would like to give the advices: 1. 
Try to get and read the vision for the next generation of R4 by Mr. 
Reiser. 2. See above.
> In this regard reiser4' plugin architecture should be really helpful 
> in order to
> add more and more functionality.
>   
Yes, but now with the real OntoFS in the ontological and ontology-based 
sense.
> DISCLAIMER:
> I'm not affiliated with ontolab and as an outsider my description doesn't
> necessarily have to describe the status or intentions of "OntoFS" 
> accurately
>   
Sorry Mat, but there are many things to say, which really will go out of 
the scope of this mailing-list.
> for more information have a look at:
> * https://picoforge.int-evry.fr/cgi-bin/twiki/view/Ontofs/Web/OntofsIntro
> (you can use translate.google.com to translate it into english from 
> vietnamese)
>   
This was a nasty try to steal my concept. I would like to give 
interested persons the advice to follow the links given in the Semantic 
File/Storage System section on the Software links webpage of the 
OntoLinux webpage. Especially you should look at: Pass - Provenace Aware 
Storage Systems. With the real OntoFS there is no need to use KBDB - 
In-Kernel Berkeley Database, because it is based on R4. (Mat I really 
don't know why you named this project. It is one of many annoying clones.)
> * http://www.eecs.harvard.edu/~syrah/pass/
> * and the corresponding wikipedia entries about ontology, semantic 
> web, etc.
>   
Yes, but once again: The content of the wikipedia is subjective and in 
some parts misleading and manipulating.
> Greetings
>
> Mat
>
>
>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>   
Have fun
Christian *<:o)
-- 
To unsubscribe from this list: send the line "unsubscribe 
reiserfs-devel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

