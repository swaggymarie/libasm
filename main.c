#include "libasm.h"
#include <stdlib.h>

//rdi rsi rdx
//supprimer retour fonction
// tester avec void * partout
// refaire tests propres

void check_strlen(void)
{
    printf("\n|%zu|\n", strlen("Hello"));
    printf("salut\n");
    printf("\n|%zu|\n", ft_strlen("Hello"));
    printf("%%%%%%%%%%%%\n");
    printf("\n|%zu|\n", ft_write(3 , NULL, 3));
    //printf("\nreturn : [%zd]\n", ft_write(1, "Hello World !", 13));
}

void check_strcmp(char *s1, char *s2)
{
    
    if (strcmp(s1, s2) == ft_strcmp(s1, s2))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
}

void check_strdup()
{
	char	dup[] = "New Malloc";
	//char	dup1[] = "little";
    printf("FT STRDUP\n");
	printf("return : |%s|\n", ft_strdup(dup));
    printf("dup terminé\n");
}

void    strdup_test(char *str)
{
    char	*str1;
	char	*str2;

	str1 = ft_strdup(str);
    printf("%s\n", str1);
	str2 = strdup(str);
    printf("---> %s\n", str2);
	if (!strcmp(str1, str2))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");

    printf("..........................\n");
	free(str1);
	free(str2);
}

void	delete_list(t_list **list)
{
		t_list *current;
		t_list *next;
 
		current = *list;
    	while (current != NULL)
    	{
        	next = current->next;
        	free(current);
        	current = next;
    	}
		*list = NULL;
}

void	list_add_back(t_list **alst, t_list *new)
{
	t_list	*tmp;

	if (!alst || !new)
		return ;
	if (*alst)
	{
		tmp = *alst;
		while (tmp->next)
			tmp = tmp->next;
		tmp->next = new;
	}
	else
		*alst = new;
}

t_list	*list_new(void *data)
{
	t_list		*lst;

	if (!(lst = malloc(sizeof(t_list))))
		return (NULL);
	lst->data = data;
	lst->next = NULL;
	printf("cc\n");
	return (lst);
}

void	print_list(t_list *list)
{
	t_list	*tmp;

	tmp = list;
	while (tmp)
	{
		printf("%p\n", tmp->data);
		tmp = tmp->next;
	}
}

void	print_string_list(t_list *list)
{
	t_list	*tmp;

	tmp = list;
	while (tmp)
	{
		printf("%s\n", tmp->data);
		tmp = tmp->next;
	}
}
int get_int(void* value){
	printf("salut get int\n");
	int i;

	i = *((int *) value);
	printf("popopo\n");
    return (i);
}

int cmp_int(void *a, void *b)
{
	printf("salut cmp int\n");
	return (get_int(a) - get_int(b));
}


int     list_sort_test()
{
    t_list	*list;

	list = NULL;
	printf("LIST SORT\n");

	void *v;

	v = malloc(sizeof(void *));
	v = (void *)6;
    list_add_back(&list, list_new(v));
	v = (void *)4;
    list_add_back(&list, list_new(v));
    //list_add_back(&list, list_new((void *)12));
	//list_add_back(&list, list_new((void *)45));
    //list_add_back(&list, list_new((void *)1));
    //list_add_back(&list, list_new((void *)-1));
	//list_add_back(&list, list_new((void *)232));
    //list_add_back(&list, list_new((void *)34));
    //list_add_back(&list, list_new((void *)23));
	//45 1 -1 232 34 23
    //list_add_back(&list, list_new(strdup("6")));
    //list_add_back(&list, list_new(strdup("4")));
    //list_add_back(&list, list_new(strdup("6")));
    //list_add_back(&list, list_new(strdup("3")));
    //list_add_back(&list, list_new(strdup("8")));
    //list_add_back(&list, list_new(strdup("3")));
    print_list(list);
    printf("_________________________\n");
    printf("%d\n", ft_list_sort(&list, cmp_int));
    print_list(list);
	//print_string_list(list);
	delete_list(&list);
    return(1);
}

int     list_push_front_test()
{
    t_list	*list;

	list = NULL;
	char *str;

	str = strdup("1");
    list_add_back(&list, list_new("1"));
    list_add_back(&list, list_new("5"));
    list_add_back(&list, list_new("6"));
    list_add_back(&list, list_new("8"));
    printf("PUSH FRONT TEST\n");
    print_list(list);
    printf("___________________\n");
    printf("%d\n",ft_list_push_front(&list, str));
    //ft_list_push_front(&list, (void *)8);
    print_list(list);
	delete_list(&list);
	free(str);
    return(1);
}

int     list_remove_if_test()
{
    t_list	*list;
	char 	*str;

	list = NULL;
	str = strdup("7");
    list_add_back(&list, list_new("5"));
    list_add_back(&list, list_new("1"));
    list_add_back(&list, list_new("6"));
    list_add_back(&list, list_new("8"));
    list_add_back(&list, list_new("7"));
    printf("\nREMOVE IF TEST\n");
    print_string_list(list);
    printf("___________________\n");
    printf("%d\n", ft_list_remove_if(&list, str, &strcmp));
    print_string_list(list);
	delete_list(&list);
	free(str);
	str = NULL;
    return(1);
}

void    atoi_base_test(char *nb, char* base, int expected)
{
	int ret;

	ret = ft_atoi_base(nb, base);
	if (ret == expected)
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
        
}

void 	list_push_front_test()
{
	t_list	*list;

	list = NULL;
	ft_list_push_front(&list, strdup("coucou"));
	if (strcmp(list->data, "coucou" == 0))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");

	ft_list_push_front(&list, (void *)6);
	if (cmp(list->data, (void *)6 == 0))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
	delete_list(&list);
}

void 	list_remove_if_test()
{
	t_list	*list;
	int		len;


	list = NULL;
	ft_list_remove_if(&list, "cc", strcmp);

	list_add_back(&list, list_new("cc"));
	ft_list_remove_if(&list, "cc", strcmp);
	if (list == NULL)
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
	list_add_back(&list, list_new("cc"));
	list_add_back(&list, list_new("coucou"));
	ft_list_remove_if(&list, "cc", strcmp);
	if (strcmp(list->data, "coucou") == 0)
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
	delete_list(&list);
}

void	list_sort_test()
{
	t_list	*list;
	t_list	*tmp;

	list = NULL;
	
	list_add_back(&list, list_new(strdup("6")));
    list_add_back(&list, list_new(strdup("4")));

	tmp = list;
	while(tmp)
	{
		if (strcmp(tmp->data, tmp->next->data) <= 0)
			printf("" GREEN "[OK] " RESET "");
		else
			printf("" RED "[KO] " RESET "");
		tmp = tmp->next;
	}
	delete_list(&list);
}

void	list_size_test(int len)
{
	t_list	*list;

	list = NULL;
	while (len--)
		list_add_back(&list, list_new(&len));
	if (len == ft_list_size(list))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
	delete_list(&list);
}

void	read_test()
{

}

void	strmcp_test(int ret, int ref)
{
	if (ret == ref)
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
}

void	strcpy_test(char *ret, char *ref)
{
	char	dest1[57];
	char	dest2[57];

	bzero(dest1, 57);
	bzero(dest2, 57);
	ft_strcpy(dest1, src);
	strcpy(dest2, src);
	if (strcmp(ref, ret) == 0)
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
}

void	strdup_test(char *str)
{
    char	*str1;
	char	*str2;

	str1 = ft_strdup(str);
	str2 = strdup(str);
	if (!strcmp(str1, str2))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
	free(str1);
	free(str2);
}

void	strlen_test(int ret, int ref)
{
	if (ret == ref)
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
}

void	write_test()
{

}

int main(void)
{
	printf("___________________________\n");
	printf("..........atoi_base........\n");
	printf("___________________________\n");

	atoi_base_test("0123456789", "-3", -3);
	atoi_base_test("0123456789", "", 0);
	atoi_base_test("0123456789", "-2147483648", -2147483648);
	atoi_base_test("0123456789", "2147483647", 2147483647);
	atoi_base_test("0123456789", "2147483k648", 2147483);

	printf("___________________________\n");
	printf(".........push_front........\n");
	printf("___________________________\n");

	list_push_front_test();

	printf("___________________________\n");
	printf("..........remove_if........\n");
	printf("___________________________\n");

	list_remove_if_test();

	printf("___________________________\n");
	printf("............sort...........\n");
	printf("___________________________\n");

	list_sort_test();

	printf("___________________________\n");
	printf("..........list_size........\n");
	printf("___________________________\n");
	list_size_test(0);
	list_size_test(8);
	list_size_test(1);
	list_size_test(666666666);


	printf("___________________________\n");
	printf("............strcmp.........\n");
	printf("___________________________\n");
    strmcp_test(ft_strcmp("cc", ""), strcmp("cc", ""));
    strmcp_test(ft_strcmp("", ""), strcmp("", ""));
    strmcp_test(ft_strcmp("blabalabla&", "blabalabla&"), strcmp("blabalabla&", "blabalabla&"));


	printf("___________________________\n");
	printf("............strcpy.........\n");
	printf("___________________________\n");
    strcpy_test(ft_strcpy("coco", "barbapapa"), "barbapapa");
	strcpy_test(ft_strcpy("coco", ""), "");
    strcpy_test(ft_strcpy("coco", "\0\0"), "\0\0");

	

	printf("___________________________\n");
	printf("...........strdup..........\n");
	printf("___________________________\n");
	strdup_test("Que neni");
	strdup_test("666666666666666666666666666666666666666666666666666666666666666666");
	strdup_test("");

	printf("___________________________\n");
	printf("............strlen.........\n");
	printf("___________________________\n");
    strlen_test(ft_strlen("coucou"), strlen("coucou"));
    strlen_test(ft_strlen(NULL), strlen(NULL));

	printf("___________________________\n");
	printf("............write..........\n");
	printf("___________________________\n");
	write_test("");

	printf("___________________________\n");
	printf("............read...........\n");
	printf("___________________________\n");
    read_test();
	printf("\n\n");
    return(1);
}