# Network Operating Systems - Semestral project Minimization Of OS

## Team members

* **Matej Gradoš**
* **Patrik Horčička** 
* **Radim Macho** 
* **Vilém Pecháček** 

### Table of contents 
* [Project description](#description)
* [Project objectives](#objectives)
* [Commands executed](#commands)

<a name="description"></a>

## Project description

<p> Skupinový projekt zahrnuje úpravy operačního systému s jádrem Linux. Zadáním projektu je upravit systém tak, aby se zmenšila jeho velikost.
Minimalizovaný systém musí umožňovat: </p>

1. Zobrazení hlavní stránky VUT www.vutbr.cz.
2. Zobrazení skript pro předmět SOS.

- [ ] Stránka musí být zobrazena v originální podobě s obrázky. 
- [ ] Skripta musí být zobrazena pomocí lokálního PDF prohlížeče. 

<p> Zobrazení musí být provedeno bez výrazných prodlev, tj. v rámci běžného zpoždění v operačním systému. Nelze například automaticky instalovat soft- ware teprve po požadavku na zobrazení stránky/skript. </p>

- [ ] Systém musí být schopen **opětovného startu** po prvním spuštění.


<p> Operační systém pro řešení projektu si lze zvolit z následujících: </p>
* CentOS Stream | www.centos.org
* Fedora | www.getfedora.org
* Debian | www.debian.org
* Ubuntu | www.debian.org

<p> Pro řešení projektu musí být vždy použita **aktuální verze operačního systému** platná k začátku semestru. </p>
<p> Prozkoumání distribucí a nalezení nevhodnější pro řešitelský kolektiv je součástí projektu. </p>

<p> Virtualizační nástroj Oracle VM VirtualBox je k dispozici na www.virtualbox.org. Opět musí být použita aktuální verze platná k začátku semestru.</p>


<a name="objectives"></a>

## Project objectives

Minimalizovaný systém musí umožňovat:

- [ ] Zobrazení hlavní stránky VUT www.vutbr.cz.
- [ ] Zobrazení skript pro předmět SOS.

❗Stránka musí být zobrazena v originální podobě s obrázky. 
❗Skripta musí být zobrazena pomocí lokálního PDF prohlížeče. 

<p> Zobrazení musí být provedeno bez výrazných prodlev, tj. v rámci běžného zpoždění v operačním systému. Nelze například automaticky instalovat soft- ware teprve po požadavku na zobrazení stránky/skript. </p> 

❗Systém musí být schopen opětovného startu po prvním spuštění.
❗Výstupem projektu je upravený operační systém ve formě virtuálního stroje, který je spustitelný programem Oracle VM VirtualBox (VB).

<a name="commands"></a>
## Commands executed
`dnf -y install xorg-x11-server-Xorg twm arora xinit mupdf`
